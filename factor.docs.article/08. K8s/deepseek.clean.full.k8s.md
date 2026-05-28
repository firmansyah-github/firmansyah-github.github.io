Great 🚀 Let’s extend the cleanup script to **wipe absolutely everything**:

* Deletes all Kind clusters
* Deletes Colima VM
* Uninstalls Homebrew packages
* Removes configs (kubeconfig, Colima, Lens)
* Removes **MetalLB** namespace
* Cleans **Docker networks, volumes, images**
* Runs `brew cleanup` for a full Homebrew sweep

Here’s the **full script**:

```bash
#!/bin/bash
set -e

echo "🧹 Cleaning up Kubernetes (Kind + Colima + Lens) setup on macOS..."

# 1. Stop and delete Kind clusters
if command -v kind &>/dev/null; then
  echo "🗑 Deleting Kind clusters..."
  kind get clusters | while read -r cluster; do
    kind delete cluster --name "$cluster"
  done
else
  echo "⚠️ Kind not installed, skipping cluster cleanup."
fi

# 2. Stop and delete Colima VM
if command -v colima &>/dev/null; then
  echo "🗑 Stopping and deleting Colima..."
  colima stop || true
  colima delete || true
else
  echo "⚠️ Colima not installed, skipping."
fi

# 3. Uninstall Homebrew packages
echo "🗑 Uninstalling brew packages..."
brew uninstall --force kind || true
brew uninstall --force colima || true
brew uninstall --force docker || true
brew uninstall --force kubectl || true
brew uninstall --cask --force openlens || true

# 4. Remove leftover configs
echo "🗑 Removing config files..."
rm -rf ~/.kube
rm -rf ~/.colima
rm -rf ~/Library/Application\ Support/OpenLens
rm -rf ~/Library/Preferences/com.electron.openlens.plist
rm -rf ~/Library/Saved\ Application\ State/com.electron.openlens.savedState
rm -rf ~/Library/Logs/OpenLens

# 5. Remove MetalLB configs (if still applied)
if command -v kubectl &>/dev/null; then
  echo "🗑 Removing MetalLB (if exists)..."
  kubectl delete namespace metallb-system --ignore-not-found
fi

# 6. Cleanup Docker system
if command -v docker &>/dev/null; then
  echo "🗑 Pruning Docker system (images, containers, volumes, networks)..."
  docker system prune -af || true
  docker volume prune -f || true
  docker network prune -f || true
  docker builder prune -af || true

  # specifically remove kind network if left
  if docker network inspect kind &>/dev/null; then
    echo "🗑 Removing Kind network..."
    docker network rm kind || true
  fi
fi

# 7. Cleanup Homebrew caches
echo "🗑 Running brew cleanup..."
brew cleanup -s || true

echo "✅ Cleanup complete. Your MacBook is now free from Colima + Kind + Lens + MetalLB + Docker leftovers."
```

---

## 🔧 Usage

1. Save as `cleanup_k8s_full.sh`
2. Make executable:

   ```bash
   chmod +x cleanup_k8s_full.sh
   ```
3. Run:

   ```bash
   cd "/Users/firmansyah.profess/factor-workspace/firmansyah.factor.starterkit.playground/factor.docs.article/08. K8s"
   ./deepseek.clean.full.k8s.sh
   ```

---

⚠️ This will **wipe ALL Docker containers, images, volumes, and networks**, not just those related to Kind/Colima.

Do you want me to make a **safer version** that only removes Kind/Colima-related Docker resources (keeping your other Docker stuff intact)?



# How to Stop/Disable Ingress Access via http://nginx.local/

Here are several methods to stop or disable the Ingress access to your NGINX service:

## Method 1: Delete the Ingress Resource (Recommended)

```bash
# Delete the specific ingress resource
kubectl delete ingress nginx-ingress -n nginx-ns

# Verify it's gone
kubectl get ingress -n nginx-ns
```

## Method 2: Scale Down the Ingress Controller

```bash
# Scale down the nginx-ingress controller to 0 replicas
kubectl scale deployment -n ingress-nginx ingress-nginx-controller --replicas=0

# Verify no ingress pods are running
kubectl get pods -n ingress-nginx
```

## Method 3: Remove the Hosts File Entry

```bash
# Remove the nginx.local entry from /etc/hosts
sudo sed -i '' '/nginx.local/d' /etc/hosts

# Or edit manually
sudo nano /etc/hosts
# Remove the line: 127.0.0.1 nginx.local
```

## Method 4: Delete the Entire Ingress Namespace

```bash
# Delete the entire ingress-nginx namespace (will remove everything)
kubectl delete namespace ingress-nginx

# Verify namespace is gone
kubectl get namespaces
```

## Method 5: Modify the Ingress to Disable Routing

```bash
# Edit the ingress to remove the nginx.local rule
kubectl edit ingress nginx-ingress -n nginx-ns

# Change the host field to something else, or remove the rule entirely
```

## Method 6: Use NetworkPolicy to Block Traffic

```bash
# Create a NetworkPolicy to block all ingress traffic
cat > block-ingress.yaml << EOF
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: block-all-ingress
  namespace: nginx-ns
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  ingress: []
EOF

kubectl apply -f block-ingress.yaml -n nginx-ns
```

## Complete Cleanup Script

```bash
#!/bin/bash
echo "Stopping Ingress access via nginx.local..."

# 1. Delete the ingress resource
echo "Deleting ingress resource..."
kubectl delete ingress nginx-ingress -n nginx-ns 2>/dev/null

# 2. Remove hosts file entry
echo "Removing hosts file entry..."
if [ -f "/etc/hosts" ]; then
    sudo sed -i '' '/nginx.local/d' /etc/hosts
    echo "Removed nginx.local from /etc/hosts"
fi

# 3. Optional: Scale down ingress controller
echo "Scaling down ingress controller..."
kubectl scale deployment -n ingress-nginx ingress-nginx-controller --replicas=0 2>/dev/null

# 4. Verify cleanup
echo "Verifying cleanup..."
echo "Current ingress resources:"
kubectl get ingress -A 2>/dev/null | grep -v "No resources found"

echo "Hosts file content:"
grep -n "nginx.local" /etc/hosts 2>/dev/null || echo "No nginx.local entry found"

echo "Ingress controller status:"
kubectl get pods -n ingress-nginx 2>/dev/null | grep -v "No resources found"

echo -e "\nIngress access via http://nginx.local/ has been stopped!"
```

## Verification Commands

After stopping the ingress, verify it's no longer accessible:

```bash
# Test if nginx.local is still accessible
curl -v http://nginx.local/ 2>&1 | grep -E "(HTTP|Failed|Could not resolve)"

# Check if the hosts entry still exists
grep "nginx.local" /etc/hosts

# Check if ingress resources still exist
kubectl get ingress -A

# Check if ingress controller pods are running
kubectl get pods -n ingress-nginx
```

## Expected Output When Successfully Stopped

```
$ curl -v http://nginx.local/
* Could not resolve host: nginx.local
* Closing connection 0
curl: (6) Could not resolve host: nginx.local

$ kubectl get ingress -n nginx-ns
No resources found in nginx-ns namespace.

$ kubectl get pods -n ingress-nginx
No resources found in ingress-nginx namespace.
```

## Quick One-Liner Stoppage

```bash
# Quickest way to stop ingress access
kubectl delete ingress nginx-ingress -n nginx-ns 2>/dev/null; sudo sed -i '' '/nginx.local/d' /etc/hosts
```

## Important Notes

1. **Method 1** (delete ingress resource) is the cleanest and most recommended approach
2. **Method 2** (scale down controller) affects all ingresses, not just nginx.local
3. **Method 3** (remove hosts entry) only affects local DNS resolution
4. The service itself will still be accessible via other methods (NodePort, LoadBalancer, etc.) unless you also delete/stop those

Choose the method that best fits your needs. For temporary disabling, Method 1 or 2 is recommended. For permanent removal, delete the ingress resource.
Got it 🚀 — I’ll extend your setup guide with the extra requirements:

* **Create a namespace for workloads**
* **Expose NGINX via LoadBalancer (works with Kind + MetalLB)**
* **Patch NGINX so it shows which pod (node) is serving requests**

Here’s the updated article:

---

# 🛠 Step-by-Step Setup Guide (macOS, 2025)

---

## 1️⃣ Install **Colima** (Container Runtime)

Colima replaces Docker Desktop. It runs Docker containers inside a lightweight Lima VM.

```bash
brew install colima
brew install docker
```

Start Colima with some resources (adjust to your Mac’s specs):

```bash
colima start --cpu 4 --memory 8 --disk 60
```

👉 This gives you a Docker-compatible runtime (`docker ps` will now work).

---

## 2️⃣ Install **Kind** (Kubernetes IN Docker)

Kind runs Kubernetes clusters inside Docker (Colima).

```bash
brew install kind
```

Create a cluster config file with **MetalLB** (for LoadBalancer services):

```yaml
# kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
    extraPortMappings:
      - containerPort: 80
        hostPort: 8080
      - containerPort: 443
        hostPort: 8443
```

Create the cluster:

```bash
kind create cluster --name dev-cluster --config kind-config.yaml
```

👉 This sets up port-forwarding so LoadBalancer services can map to your host.

---

## 3️⃣ Install **kubectl** (Kubernetes CLI)

```bash
brew install kubectl
```

Verify it works:

```bash
kubectl get nodes
```

---

## 4️⃣ Install **Lens (OpenLens)** GUI

```bash
brew install --cask openlens
```

👉 Launch **Lens (OpenLens)** from Applications.
It will automatically detect your Kind clusters from `~/.kube/config`.

---

## 5️⃣ Configure **Namespace + MetalLB LoadBalancer**

### Create a dedicated namespace:

```bash
kubectl create namespace nginx-ns
```

### Install MetalLB (LoadBalancer for local clusters):

```bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.3/config/manifests/metallb-native.yaml
```

Wait until all pods are ready:

```bash
kubectl -n metallb-system get pods
```

Configure an IP address pool (using Docker network range):

```yaml
# metallb-config.yaml
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  namespace: metallb-system
  name: default-address-pool
spec:
  addresses:
  - 172.18.255.1-172.18.255.250
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  namespace: metallb-system
  name: l2-advertisement
```

Apply it:

```bash
kubectl apply -f metallb-config.yaml
```

---

## 6️⃣ Deploy **NGINX (3 replicas, LoadBalancer, pod identity)**

Here’s the manifest:

```yaml
# nginx-nginx-ns.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-index
  namespace: nginx-ns
data:
  index.html: |
    <html>
    <body style="font-family: sans-serif; text-align: center; margin-top: 50px;">
      <h1>Served by NGINX Pod: $(POD_NAME)</h1>
    </body>
    </html>
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  namespace: nginx-ns
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginxinc/nginx-unprivileged:stable
        ports:
        - containerPort: 80
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
      volumes:
      - name: index
        configMap:
          name: nginx-index

```



---

## 7️⃣ Test the Setup

Apply workloads:

```bash
kubectl apply -f nginx-nginx-ns.yaml
```

Check pods:

```bash
kubectl -n nginx-ns get pods -o wide
```

Get service external IP:

```bash
kubectl -n nginx-ns get svc nginx
```

Open in browser:

```
http://<EXTERNAL-IP>
```

Refresh the page → you should see **different pod names** serving requests 🚀

---

## 🎯 Your Updated Setup Summary

* **Namespace `nginx-ns`** → isolates workloads
* **MetalLB** → LoadBalancer support in Kind
* **NGINX (3 replicas)** → LoadBalanced service
* **Dynamic Pod Identity** → shows which pod handled the request

---

👉 Do you want me to package this into a **single ready-to-apply YAML (Deployment + ConfigMap + Service)** so you can just `kubectl apply -f full-nginx-ns.yaml` and see it work immediately in Lens?

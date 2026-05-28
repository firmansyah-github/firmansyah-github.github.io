#!/bin/bash
set -e  # Exit on any error

echo "=== Setting up Local Kubernetes Environment on MacBook ==="

# Install prerequisites using Homebrew
echo "Installing prerequisites..."
brew update
brew install colima kind kubectl docker

# Start Colima VM
echo "Starting Colima VM..."
#colima start --vm-type=vz --cpu=2 --memory=8 --disk=20
colima start --vm-type=vz --cpu 4 --memory 8 --disk 60

# Create Kind configuration file
cat > kind-config.yaml << EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: development-1
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30080
    hostPort: 30080
    protocol: TCP
  - containerPort: 80
    hostPort: 80
    protocol: TCP
EOF

# Create Kind cluster
echo "Creating Kind cluster..."
kind create cluster --config kind-config.yaml

# Set kubectl context to the new cluster
kubectl cluster-info --context kind-development-1

# Create namespace
echo "Creating namespace..."
kubectl create namespace nginx-ns

# Create NGINX deployment with 3 replicas
cat > nginx-deployment.yaml << EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: nginx-ns
  labels:
    app: nginx
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
        image: nginx:latest
        volumeMounts:
        - name: podinfo
          mountPath: /etc/podinfo
        ports:
        - containerPort: 80
        resources:
          limits:
            memory: "128Mi"
            cpu: "500m"
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        # Create a custom index page that shows pod info
        command: 
        - /bin/sh
        - -c
        args:
        - |
          POD_NAMEX=$(cat /etc/podinfo/name)
          POD_IPX=$(cat /etc/podinfo/ip)
          echo "<html>
          <head><title>NGINX</title></head>
          <body>
            <h1>Pod: $POD_NAMEX</h1>
            <p>IP: $POD_IPX</p>
            <p>Host: $HOSTNAME</p>
            <p>Time: $(date)</p>
          </body>
          </html>" > /usr/share/nginx/html/index.html
          exec nginx -g 'daemon off;'
      volumes:
      - name: podinfo
        downwardAPI:
          items:
          - path: "name"
            fieldRef:
              fieldPath: metadata.name
          - path: "ip"
            fieldRef:
              fieldPath: metadata.uid
EOF

# Apply the deployment
echo "Deploying NGINX with 3 replicas..."
kubectl apply -f nginx-deployment.yaml

# Create LoadBalancer service
cat > nginx-service.yaml << EOF
apiVersion: v1
kind: Service
metadata:
  name: nginx
  namespace: nginx-ns
spec:
  type: LoadBalancer
  selector:
    app: nginx
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
EOF

# Apply the service
echo "Creating LoadBalancer service..."
kubectl apply -f nginx-service.yaml

# Wait for pods to be created
echo "Waiting for pods to be created..."
while ! kubectl get pods -n nginx-ns -l app=nginx --field-selector=status.phase!=Completed -o name | grep -q "^pod/"; do
    sleep 3
done

# Now wait for pods to be ready
echo "Pods created. Waiting for them to be ready..."
kubectl wait --namespace nginx-ns --for=condition=ready pod --selector=app=nginx --timeout=120s

# Check if wait was successful
if [ $? -eq 0 ]; then
    echo "Pods are ready!"
else
    echo "Timeout waiting for pods to be ready."
    exit 1
fi


# Display cluster information
echo "=== Cluster Information ==="
echo "Nodes:"
kubectl get nodes

echo "Pods in nginx-ns namespace:"
kubectl get pods -n nginx-ns -o wide

echo "Services in nginx-ns namespace:"
kubectl get svc -n nginx-ns

echo "Deployment status:"
kubectl get deployment -n nginx-ns

## 4️⃣ Install **Lens (OpenLens)** GUI
#👉 Launch **Lens (OpenLens)** from Applications.
#It will automatically detect your Kind clusters from `~/.kube/config`.
echo "Lens will automatically connect to the Kind cluster."
# Install **Lens (OpenLens)** if not installed
if ! command -v openlens &> /dev/null; then
  echo "Lens (OpenLens) is not installed. Installing..."
brew install --cask openlens


# Get the URL for access
echo "=== Access Information ==="
echo "NGINX can be accessed via:"
echo "1. Localhost: http://localhost:80 (via LoadBalancer)"
echo "2. Direct pod access using kubectl port-forward:"
echo "   kubectl port-forward -n nginx-ns deployment/nginx-deployment 8080:80"
echo "   Then access: http://localhost:8080"

echo "=== Setup Complete ==="
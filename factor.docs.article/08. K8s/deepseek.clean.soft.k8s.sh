#!/bin/bash
set -e  # Exit on any error

# Delete cluster
echo "Deleting Kind cluster..."
kind delete cluster --name development-1

# Stop Colima
echo "Stopping Colima..."
colima stop
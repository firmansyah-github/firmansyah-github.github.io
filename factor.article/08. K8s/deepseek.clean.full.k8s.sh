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

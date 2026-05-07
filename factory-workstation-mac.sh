#!/usr/bin/env bash

set -u

log_install() {
  local name="$1"
  echo "Install ${name}"
}

log_result() {
  local name="$1"
  local code="$2"
  if [ "$code" -eq 0 ]; then
    echo "${name} installed successfully."
  else
    echo "Error installing ${name}!!!"
  fi
  echo "* * * * * * * * * *"
}

install_formula() {
  local package="$1"
  local label="${2:-$1}"
  log_install "$label"
  brew install "$package"
  log_result "$label" "$?"
}

install_cask() {
  local package="$1"
  local label="${2:-$1}"
  log_install "$label"
  brew install --cask "$package"
  log_result "$label" "$?"
}

echo "## Basic Dev Utilities Section"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed."
  echo "Install it first with:"
  echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
fi

install_cask dotnet-sdk "Microsoft.DotNet.SDK"

echo "Skipping Microsoft.DotNet.SDK.3_1 (EOL / likely unavailable in Homebrew)"
echo "* * * * * * * * * *"
echo "Skipping Microsoft.DotNet.SDK.5 (EOL / likely unavailable in Homebrew)"
echo "* * * * * * * * * *"

install_cask windows-app "Microsoft.WindowsTerminal equivalent"
install_formula powershell "Microsoft.Powershell"
install_formula azure-cli "Microsoft.AzureCLI"
install_formula bicep "Microsoft.Bicep"
install_formula azd "Microsoft.Azd"
install_cask azure-data-studio "Microsoft.AzureDataStudio"
install_formula azure-functions-core-tools@4 "Microsoft.AzureFunctionsCoreTools"
install_formula kubectl "Kubernetes.kubectl"
install_formula podman "RedHat.Podman"
install_formula git "Git.Git"
install_formula gh "GitHub.cli"
install_cask docker "Docker.DockerDesktop"
install_cask visual-studio-code "Microsoft.VisualStudioCode"

echo "Skipping Microsoft.Azure.StorageEmulator (Windows-only, no macOS equivalent)"
echo "* * * * * * * * * *"

install_cask storage-explorer "Microsoft.AzureStorageExplorer"
install_cask insomnia "Insomnia"

echo "Skipping Microsoft.VisualStudio.Enterprise (no macOS Visual Studio Enterprise equivalent)"
echo "* * * * * * * * * *"

install_cask lens "Lens"
install_cask pgadmin4 "PostgreSQL.pgAdmin"

echo "Skipping Microsoft.Azure.CosmosEmulator (Windows-only, no native macOS equivalent)"
echo "* * * * * * * * * *"

install_cask microsoft-remote-desktop "Microsoft.RemoteDesktopClient"
install_cask github "GitHub.GitHubDesktop"

echo "## Misc Utilities Section"

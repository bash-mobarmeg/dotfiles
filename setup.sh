#!/usr/bin/env bash
# ===========================================
# System Setup Script for Debian/Ubuntu
# Author: [Your Name]
# Description:
#   Automates system updates, installs essential packages,
#   sets up Hyprland and Neovim, and clones dotfiles.
# ===========================================

# Exit immediately if a command fails
set -e

# --- Update and upgrade the system ---
echo "🔄 Updating system packages..."
sudo apt-get update && sudo apt-get full-upgrade -y

# --- Install essential tools ---
echo "🧰 Installing core utilities..."
sudo apt-get install -y \
  curl git neovim net-tools lua5.1 luarocks alacritty npm

# --- Install Hyprland and related utilities ---
echo "🪟 Installing Hyprland environment..."
sudo apt-get install -y \
  hyprland hyprpaper wofi waybar rofi wl-clipboard sway-notification-center grim slurp

# For Hypridle
sudo apt-get install -y wayland wayland-protocols hyprland-protocols hyprlang sdbus-c++ hyprwayland-scanner

# For Hyprlock
sudo apt-get install -y cairo hyprgraphics hyprlang hyprutils hyprwayland-scanner mesa pam pango sdbus-cpp wayland-client wayland-protocols xkbcommon


# Don't forget to install hyprshot from github

# --- Install global Node.js package managers ---
echo "📦 Installing Yarn and PNPM globally via npm..."
sudo npm i -g yarn pnpm

# --- Clone dotfiles repository ---
echo "📂 Cloning dotfiles repository..."
git clone https://github.com/bash-mobarmeg/dotfiles.git

# Copy configuration files into ~/.config
echo "🧭 Copying configuration files to ~/.config..."
mkdir -p ~/.config
cp -a ./dotfiles/* ~/.config/

# --- Install latest Neovim AppImage ---
echo "📝 Installing Neovim AppImage..."
wget https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.appimage

# Move Neovim binary to a directory in PATH
sudo mv nvim-linux-x86_64.appimage /usr/bin/nv
sudo chmod +x /usr/bin/nv

# --- Install Node Version Manager (NVM) ---
echo "💻 Installing NVM (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Load NVM into current shell session
source ~/.bashrc

# --- Install latest Node.js using NVM ---
echo "⚙️ Installing latest Node.js..."
nvm install node

echo "✅ Setup complete! System is ready."


# **My Personal NixOS & Hyprland Setup**

Welcome to my personal NixOS configuration\! This repository contains all the files needed to build a complete, beautiful, and productive desktop environment from scratch. It uses Nix Flakes for easy and reproducible builds.

The main goal is to have a system that is managed entirely by code. If I get a new computer, I can get this exact same setup running in minutes, not hours.

## **✨ Features**

This setup is built around a few core tools to create a fast, keyboard-driven experience:

* **Operating System**: [NixOS](https://nixos.org/) (Unstable channel, using Flakes)  
* **Window Manager**: [Hyprland](https://hyprland.org/) (A dynamic and stylish Wayland compositor)  
* **Shell**: [Zsh](https://www.zsh.org/) with useful plugins like zsh-autosuggestions and zsh-syntax-highlighting.  
* **Terminal**: [Foot](https://codeberg.org/dnkl/foot) (A fast and lightweight terminal for Wayland)  
* **Status Bar**: [Waybar](https://github.com/Alexays/Waybar)  
* **Application Launcher**: [Rofi](https://github.com/davatorium/rofi)  
* **Text Editor**: [Neovim](https://neovim.io/), configured to be a full-featured IDE with LSP, autocompletion, and more.  
* **File Manager**: [PCManFM](https://wiki.archlinux.org/title/PCManFM) (A lightweight file manager)

## **🚀 How to Use This Configuration**

You can use this repository as a starting point for your own NixOS setup.

### **Prerequisites**

* A running NixOS system with Git installed.  
* You have enabled Flakes in your Nix configuration.

### **Step 1: Clone the Repository**

First, clone this repository to a place you like, for example, \~/nixos-dotfiles.

```sh
git clone https://github.com/shin-tran/nixos-dotfiles.git ~/nixos-dotfiles
cd ~/nixos-dotfiles
```

### **Step 2: Edit Your Personal Information**

All personal settings like your username, email, and Git configuration are stored in one central place for easy editing.

Open the file lib/globals.nix and change the values to match your own information.

```sh
# lib/globals.nix  
{  
  username = "ngoc"; # <-- Change this to your username  
  stateVersion = "25.05";  
  system = "x86_64-linux";

  git = {  
    name = "Your Full Name";          # <-- Your name here  
    email = "your_email@example.com"; # <-- Your email here  
  };  
}
```

### **Step 3: Add Your Hardware Configuration**

Every computer has a unique hardware setup (like disk drives). The hardware-configuration.nix file contains this information. This file is specific to your machine and **should not** be committed to Git.

To handle this cleanly, you can force-track the file locally without pushing it to the remote repository.

1. Generate the file (if you don't have it):  
   During your NixOS installation, a file was generated at /etc/nixos/hardware-configuration.nix. Copy it into your repository folder.  
   ```sh
   cp /etc/nixos/hardware-configuration.nix .
   ```

2. Force-add the file to Git:  
   This command tells Git to track the file locally, even if it's in .gitignore.  
   ```sh
   git add -f hardware-configuration.nix  
   git commit -m "Add local hardware configuration"
   ```

### **Step 4: Build Your System\!**

Now you are ready to build the system. Run this command from inside your nixos-dotfiles directory:

```sh
# This is a custom command defined in the configuration.  
# For the first time, you need to run the full command:  
sudo nixos-rebuild switch --flake .#nixos-btw

# After the first build, you can use the custom alias:  
nrs
```

Nix will now build your entire system based on the configuration. Grab a coffee, and when it's done, you will have this exact desktop environment!

## **⌨️ Keybindings**

Here are some of the most important keybindings to get you started. SUPER is the Windows key.

| Keybinding | Action |
| :---- | :---- |
| SUPER + Enter | Open Terminal (Foot) |
| SUPER + D | Open App Launcher (Rofi) |
| SUPER + Q | Close active window |
| SUPER + H / J / K / L | Move focus between windows |
| SUPER + SHIFT \+ H / J / K / L | Move active window |
| SUPER + [1-9] | Switch to workspace 1-9 |
| SUPER + SHIFT + [1-9] | Move window to workspace 1-9 |
| SUPER + T | Go to an empty workspace |
| SUPER + M | Exit Hyprland (Log out) |
| SUPER + Mouse Left | Move window with mouse |
| SUPER + Mouse Right | Resize window with mouse |

## **📂 Project Structure**

* `flake.nix`: The main entry point. It defines all inputs (Nixpkgs, Home Manager) and builds the final system.  
* `configuration.nix`: System-wide settings (kernel, drivers, system services like Apache).  
* `home.nix`: User-specific settings managed by Home Manager (dotfiles, user packages, Git config).  
* `lib/globals.nix`: A central place for your personal variables.  
* `config/`: Contains all the "dotfiles" for applications like Hyprland, Neovim, Rofi, etc. These are linked into your home directory automatically.

Enjoy your new, fully declarative NixOS setup!

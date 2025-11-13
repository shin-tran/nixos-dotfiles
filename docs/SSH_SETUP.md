# SSH Key Setup for Git Authentication & Signing on NixOS

This guide details how to generate an SSH key pair (Ed25519), add it to GitHub, and configure your NixOS Home Manager setup to use it for both **Authentication** (push/pull) and **Commit Signing** (to achieve the "Verified" badge).

## 1. Generate a New SSH Key

Open your terminal and run the following command to generate a new Ed25519 SSH key pair.

> **Note:** Replace the email with your actual GitHub email address.

```bash
ssh-keygen -t ed25519 -C "your-email@gmail.com"
```

1. **File Location**: When prompted to "_Enter a file in which to save the key_", press **Enter** to accept the default location:
   - `/home/username/.ssh/id_ed25519`
2. **Passphrase**:
   - Type a secure passphrase (recommended) and press Enter.
   - Or press Enter twice for no passphrase.

## 2. Add Key to SSH Agent

Ensure the SSH agent is running and add your new key so you don't have to type the passphrase every time.

```bash
# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add your SSH private key
ssh-add ~/.ssh/id_ed25519
```

### 3. Add Public Key to Github

You must upload your public key to GitHub. You need to do this **TWICE**: once for Authentication and once for Signing.

First, copy your public key to the clipboard:

```bash
cat ~/.ssh/id_ed25519.pub
# Output example: ssh-ed25519 AAAAC3NzaC1lZDI1NTE5... your-email@gmail.com
```

Go to **GitHub Settings** -> [SSH and GPG keys](https://github.com/settings/keys).

#### A. Add for Authentication (Push/Pull)

1. Click **New SSH key**.
2. **Title**: `NixOS Desktop - Auth`
3. **Key type**: Select **Authentication Key**.
4. **Key**: Paste the content of `id_ed25519.pub`.
5. Click **Add SSH key**.

#### B. Add for Signing (Verified Badge)

1. Click **New SSH key** again.
2. **Title**: `NixOS Desktop - Signing`
3. **Key type**: Select **Signing Key** _(Important!)_.
4. **Key**: Paste the _same_ content of `id_ed25519.pub`.
5. Click **Add SSH key**.

### 4. Configure NixOS (Home Manager)

Update your Home Manager configuration to tell Git to use this SSH key for signing commits by default.

**File**: `nixos-dotfiles/modules/home-manager/cli/git.nix`

Update the file content to match the following structure:

```nix
{ config, pkgs, globals, ... }:

{
  programs.git = {
    enable = true;

    # 1. Configure User Identity
    settings.user = {
      name = globals.git.name;   # e.g., "username"
      email = globals.git.email; # e.g., "your-email@gmail.com"
    };

    # 2. Configure Signing
    signing = {
      key = "~/.ssh/id_ed25519.pub"; # Path to your PUBLIC key
      signByDefault = true;          # Automatically sign all commits
      format = "ssh";                # Use SSH format instead of GPG
    };

    # Other Git settings...
    settings = {
      init.defaultBranch = "main";
      credential.helper = "store";
      pull.rebase = true;
    };
  };
}
```

#### Apply Changes

After saving the file, apply the new configuration:

```bash
nrs desktop
```

### 5. Verification

#### Test Connection

Verify that you can authenticate with GitHub:

```bash
ssh -T git@github.com
```

Expected Output: Hi username! You've successfully authenticated...

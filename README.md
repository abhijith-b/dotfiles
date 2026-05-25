# dotfiles

Personal dotfiles for a Fedora Linux environment. Managed via symlinks.

## Structure

```
dotfiles/
├── zsh/
│   └── .zshrc          # Zsh config with aliases for k8s, docker, aws, azure, terraform, git
├── starship/
│   └── starship.toml   # Two-line DevOps prompt
└── install.sh          # Symlinks everything into place
```

## Install

```bash
git clone https://github.com/abhijith-b/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

### First-time setup

```bash
# Zsh
sudo dnf install -y zsh
chsh -s $(which zsh)   # log out and back in after this

# Starship
curl -sS https://starship.rs/install.sh | sh

# Zsh plugins
sudo dnf install -y zsh-autosuggestions zsh-syntax-highlighting

# fzf (fuzzy finder — Ctrl+R history, Ctrl+T file, Alt+C cd)
sudo dnf install -y fzf

# kubectx + kubens (fast context/namespace switching)
sudo dnf install -y kubectx

# k9s (terminal UI for Kubernetes)
# Download latest release from https://github.com/derailed/k9s/releases
# and place the binary in /usr/local/bin/k9s
```

Then run `./install.sh` and open a new shell.

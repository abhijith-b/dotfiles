#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"

  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "SKIP $dest (exists and is not a symlink — move it manually)"
    return
  fi

  ln -sf "$src" "$dest"
  echo "LINK $dest -> $src"
}

link "$DOTFILES_DIR/zsh/.zshrc"            "$HOME/.zshrc"
link "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

echo
echo "Done. Run 'source ~/.zshrc' or open a new shell to apply changes."

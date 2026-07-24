# AGENTS.md

Dotfiles repo. Each top-level folder is **manually symlinked** into `$HOME`.
No install script or symlink manager.

```sh
ln -s "$PWD/nvim" "$HOME/.config/nvim"
```

| Folder     | Symlink target          |
| ---------- | ----------------------- |
| `nvim/`    | `$HOME/.config/nvim`    |
| `lazygit/` | `$HOME/.config/lazygit` |
| `bin/`     | `$HOME/.local/bin`      |
| `chrome/`  | loaded manually in Chrome |

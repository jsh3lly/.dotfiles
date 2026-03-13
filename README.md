# How stow works:

## How to add a directory to be stowed:
Say you want to add you `nvim` config to be stowed.

You first `mv ~/.config/nvim ~/Stuff/.dotfiles`, assuming `~/Stuff/dotfiles` is THIS repository.

Then you simply do `stow -t $HOME nvim`. This will symlink `~/.dotfiles/nvim` to `~/.config/nvim`.

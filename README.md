# Dotfiles for macOS with GNU Stow

First, you need to download GNU Stow utility to manage configuration files. You can download it via Homebrew (in my case) or package manager (if you are on a linux machine):

```sh
brew install stow
```

Clone this repository and go to the this folder:

```sh
git clone https://github.com/literallyNotFate/.dotfiles.git
cd .dotfiles
```

Then synchronize this by creating symlinks with GNU Stow. For example, if you want to apply configuration to `zsh`, `ghostty` and `nvim` just do the following:

```sh
stow zsh ghostty nvim
```

If you dont want to use any utilities to manage dotfiles, just clone the repo and copy/move the files manually in the `.config` folder

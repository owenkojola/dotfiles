# Dotfile Project

## What This Dotfile Should Do

## Package Installs
- ### Check if running as root.
- ### Identify the package names in the package installer (assuming apt for Ubuntu Linux).
- ### Install packages including:
  - dnsutils
  - nmap
  - anaconda or miniconda
  - Optionally, command-line games, AWS CLI, etc.
- ### Determine how to run the remaining tasks as non-root to apply the correct ownership.

## Git Configuration
- ### Configure Git by setting:
  - Name, email
  - Core editor to either vim, nano, or emacs
  - Enable git autocorrect
- ### Copy the `.gitconfig` to the git repository.
- ### Add a symbolic link to `~/.gitconfig`.

## SSH Public Keys - Authorized Keys
- ### Check if `~/.ssh` folder exists, if not, create it.
- ### Copy `~/.ssh/authorized_keys` file to the repository and symbolically link it to `~/.ssh/authorized_keys`.
- ### Create an `~/.ssh/config` file with an entry for `fry.cs.wright.edu`, using the W-number as the login name and ensuring connectivity to WSU-Secure or Wright State VPN.

## Vim Customizations
- ### Install Vundle for managing Vim plugins.
- ### Install a chosen color scheme for Vim (e.g. gruvbox).
- ### Install a Vim improvement plugin (e.g. NERDTree).

## Below is a list of things I referenced to create this
- ### Chat GPT
- ### [Awesome-Dotfiles](https://github.com/webpro/awesome-dotfiles)
- ### [Matt Kijowski Dotfiles](https://github.com/mkijowski/dotfiles/tree/master)
- ### [Awesome-Bash-Alias](https://github.com/vikaskyadav/awesome-bash-alias)
- ### [Ultimate .bashrc File](https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c)

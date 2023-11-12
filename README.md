# PopOS (Ubuntu 22.04) Dot Files

**This repo is WIP.**

## Q&A

<details>
  <summary>Why PopOS as a base distro?</summary>
  <br>
  There are a lot of great distros, PopOS is not my favorite distro, nor is it the most reliable in my opinion, I ran arch for about 2 years and loved it, however it takes time to get things running the way I like and configure optimus and other things to work perfectly. I ran arch with encrypted root and home on a ZFS pool, whichis a bit of a hassle to get working well. Being on bleeding-edge is also not a necessity for me.
  <br><br>
  PopOS comes with a neat optimus switcher out the box, and I can quite happily work with the vanilla config should I need to. Down the line I will setup a neat Hyprland + Arch setup, but for now this works well for me.
</details>
<br>
<details>
  <summary>TODO</summary>
  <br>
  - Make a neat install.sh
  - Add config command for Touchpad right click menu
</details>

## Screenshots

![Kitty + Starship](/Screenshots/kitty.png?raw=true 'Kitty + Starship')

## Setup

### Git config

- `git config --global user.name "username"`
- `git config --global user.email "foo@bar.com"`
- `ssh-keygen -t ed25519 -C "your_email@example.com"`

Then `cat` the created .pub file and add to github under settings:
https://github.com/settings/keys

Clone this repository and enter it:

- `git clone git@github.com:hrvdm/PopOS-Dots.git`
- `cd PopOS-Dots`

### Update apt

- `sudo apt update`
- `sudo apt upgrade -y`

### Install General Packages

- `sudo add-apt-repository ppa:maarten-fonville/android-studio`

- `sudo apt install apt-transport-https code zsh gnome-tweaks gnome-shell-extensions openjdk-17-jdk git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libqt5svg5 qml-module-qtquick-controls android-studio flameshot kitty nala`

### zsh

- `chsh -s $(which zsh)`
- `nano ~/.bash_profile`
- Add the following:
  ```
  export SHELL=/bin/zsh
  exec /bin/zsh -l
  ```
- `source ~/.bash_profile`

### oh-my-zsh

- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting`
- `git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting`
- `git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete`
- `git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions`

### discord

- `wget https://dl.discordapp.net/apps/linux/0.0.34/discord-0.0.34.deb`
- `chmod +x discord-0.0.34.deb`
- `sudo dpkg -i discord-0.0.34.deb`

### rbenv

- `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash`

### JetBrainsMono Nerd Font

- `wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip`
- `unzip JetBrainsMono.zip -d ~/.fonts`
- `fc-cache -fv`

### Cargo + Rust

- `curl https://sh.rustup.rs -sSf | sh`
- `source "$HOME/.cargo/env"`

### [macchina](https://github.com/Macchina-CLI/macchina/wiki/Installation)

- `git clone https://github.com/grtcdr/macchina`
- `cd macchina`
- `cargo build --release`
- `strip target/release/macchina`
- `sudo cp target/release/macchina /bin/`

### [Starship](https://starship.rs/)

- `curl -sS https://starship.rs/install.sh | sh`

### Copy config files to the correct location

- `cp -r Wallpapers ~`
- `cp .zshrc ~`
- `cp .netrc ~`
- `mv -r .config/* ~/.config`

### Setup .netrc (for mapbox development)

- `echo 'password {YOUR API TOKEN}' >> ~/.netrc`

### Install NVM

- `curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash `

### Install ruby version

Yes I know this is an outdated version. Some codebases I work on use it.
You do not need to install this.

- `rbenv install 2.7.5`
- `rbenv global 2.7.5`

### Enable shell themeing

- Install https://extensions.gnome.org/extension/19/user-themes/

### ocs-url

- Download latest .deb from https://www.opendesktop.org/p/1136805/
- `chmod +x ocs-url_3.1.0-0ubuntu1_amd64.deb`
- `sudo dpkg -i ocs-url_3.1.0-0ubuntu1_amd64.deb`

### Obsidian

I use the $8/mo Sync package, but if you dont want to pay for Sync, you can selfhost [obsidian-livesync](https://github.com/vrtmrz/obsidian-livesync/)

- Download latest .deb from https://obsidian.md/download
- `chmod +x obsidian_1.4.16_amd64.deb`
- `sudo dpkg -i obsidian_1.4.16_amd64.deb `

### VMWare Workstation Pro

Download Workstation Pro from here: https://www.vmware.com/uk/products/workstation-pro/workstation-pro-evaluation.html
- `chmod +x VMware-Workstation-Full-17.5.0-22583795.x86_64.bundle`
- `sudo ./VMware-Workstation-Full-17.5.0-22583795.x86_64.bundle`

### Set Hostname

- `hostnamectl set-hostname new-hostname`

## Theming

1. Disable un-needed extensions

- Open GNOME Extensions
- Disable:
  - Auto Move Windows
  - Cosmic Dock
  - Cosmic Workspaces
  - Desktop Icons NG
  - Launch new instance
  - Native Window Placement
  - Places Status Indicator
  - Screenshot Window Sizer
  - Window List
  - Workspace Indicator

2. WhiteSur Theme

   - `git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git`
   - `cd WhiteSur-icon-theme`
   - `./install.sh -c Dark`
   - `./install.sh -c Dark -l` (Libadwaita fix)
   - `./tweaks.sh --firefox`
   - `sudo ./tweaks.sh --gdm`
   - `sudo ./tweaks.sh -g -b "my picture.jpg"`

   You may need to follow the steps here:

   - https://github.com/vinceliuice/WhiteSur-firefox-theme#macos-and-windows-version

2. WhiteSur Icons

   - `git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git`
   - `cd WhiteSur-icon-theme`
   - `./install.sh `
  
4. Cursor Theme

   Currently I use this theme: https://www.gnome-look.org/p/1358330
   
   If you have been following this guide so far, you can just install with ocs-url.

## Other

### Custom firefox startpage

I use a custom startpage for firefox across all my machines. You can set one via:

- Edit -> Preferences -> General -> Home Page

### Disable hardware acceleration in Firefox

Firefox seems to like to crash sometimes. Disabling hardware acceleration can help:

- Settings -> General -> Performance -> Uncheck Use recommended performance settings.

### Razer Blade 15 2020

Some useful things for Razer users:

#### Keyboard Controls:

- `sudo add-apt-repository ppa:openrazer/stable`
- `sudo add-apt-repository ppa:polychromatic/stable`
- `sudo apt update`
- `sudo apt install openrazer-meta polychromatic`
- `sudo gpasswd -a $USER plugdev`

#### Fix sleep/wake issues:

- `sudo kernelstub -a "button.lid_init_state=open"`

You can check this was applied with

- `cat /sys/module/button/parameters/lid_init_state`

Revert this with:

- `sudo kernelstub -d "button.lid_init_state=open"`

#### Remove LibreOffice:

I just use the Gsuite or obsidian, so this is wasted space.

- `sudo apt-get remove --purge libreoffice\*`
- `sudo apt-get clean`

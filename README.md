<div align="center">
    <h1>🍣 hrvdm's dot's</h1>
    <h3><b>🚧 Please dont blindly execute or copy files.</b></h3>
    
[![](https://img.shields.io/github/repo-size/hrvdm/.dots?color=%23DDB&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=18181a)](https://github.com/hrvdm/.dots)
</div>

<div align="center">
<h2>🌿 Setup</h2>
</div>

### 1. Install Arch

Follow the Arch docs:

- [Arch Install Docs](https://wiki.archlinux.org/title/installation_guide)

Quickstart guide:

- [A neat guide](https://dev.to/mjnaderi/installing-arch-linux-with-full-disk-encryption-16e9)

1. Connect to wifi with [`iwctl`](https://wiki.archlinux.org/title/Iwd#iwctl)
2. Change `vreduce --size -256M vg0/home` to `pvresize --setphysicalvolumesize -256M /dev/vg0/home`

**Pacstrap:**

Even if you do not plan to use `vim`, you need it for `visudo`. You can change this but it's easier to use vim for first install.

- Enter write mode with `i`.
- Save and exit with `:w` then `:qa`.

```
pacstrap -K /mnt base linux linux-firmware openssh git vim sudo nano networkmanager lvm2 reflector ufw base-devel rust
```

**Configure via SSH:**

If you want to SSH to your system after arch is installed:

**_Remember to disable this post-install_**

1. Make sure it has an IP, if not connect it.
2. Start SSH daemon - `sudo systemctl start sshd`
3. Enable SSH daemon - `sudo systemctl enable sshd`
4. Allow SSH in UWF: `sudo ufw allow 22/tcp`
5. Grab your IP: `ip a | grep "inet 192.168."`

### 2. Install Packages

Update sources:

```
sudo pacman -Syu
```

Install [yay](https://github.com/Jguer/yay):

```bash
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
```

Install packages:

```
sudo pacman -S hyprland xdg-desktop-portal-hyprland zsh kitty nodejs npm blueman pulseaudio pulseaudio-bluetooth dunst pipewire wireplumber polkit-kde-agent
```

```
yay -S rbenv waybar-hyprland swww wofi ttf-jetbrains-mono-nerd pulseaudio-ctl flameshot firefox discord ttf-iosevka-nerd ttf-font-awesome ttf-material-icons-git
```

Install [oh-my-zsh](https://ohmyz.sh/#install)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install [starship](https://starship.rs/)

```bash
curl -sS https://starship.rs/install.sh | sh
```

(_optional_) Install [nvm](https://github.com/nvm-sh/nvm)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

(_optional_) Install [macchina](https://github.com/Macchina-CLI/macchina/wiki/Installation)

```
cargo install macchina
```

_If you do not install the optional packages, edit `.zshrc`_

**Enable services:**

```
systemctl enable ly.service
```

### 3. Clone & Move config

1. Clone this repo: `git clone https://github.com/hrvdm/dots.git`

<div align="center">
<h2>📷 Screenshots</h2>
</div>

<div align="center">
<h2>⚙️ Troubleshooting</h2>
</div>

<details>
  <summary>...</summary>

</details>

<div align="center">
<h2>📓 Credits</h2>
</div>

#### [1amSimp1e](https://github.com/1amSimp1e/dots/tree/summer%E2%98%80%EF%B8%8F)

#### [k-vernooy](https://github.com/k-vernooy/dotfiles)

#### [saimoomedits](https://github.com/saimoomedits/dotfiles)

#### [JaKooLit](https://github.com/JaKooLit/Hyprland-Dots/tree/main)

#### [sameemul-haque](https://github.com/sameemul-haque/dotfiles)

#### [rxyhn](https://github.com/rxyhn/yoru)

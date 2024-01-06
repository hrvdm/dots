<div align="center">
    <h1>🍣 hrvdm's dot's</h1>
    <h3><b>🚧 Please dont blindly execute or copy files.</b></h3>
    
[![](https://img.shields.io/github/repo-size/hrvdm/.dots?color=%23DDB&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=18181a)](https://github.com/hrvdm/.dots)
|            |                                                                    |
| ---------- | ------------------------------------------------------------------ |
| foreground | <span style="color: #a9b1d6">&#9724; #a9b1d6</span>                |
| background | <span style="color: #101012">&#9724; #101012</span>                |
| Red        | <span style="color: #f7768e">&#9724; #f7768e</span>                |
| Green      | <span style="color: #73daca">&#9724; #73daca</span>                |
| Yellow     | <span style="color: #e0af68">&#9724; #e0af68</span>                |
| Pink       | <span style="color: #ff79c6">&#9724; #ff79c6</span>                |
| Light Blue | <span style="color: #7dcfff">&#9724; #7dcfff</span>                |
| Blue       | <span style="color: #7aa2f7">&#9724; #7aa2f7</span>                |
| Off White  | <span style="color: #c0caf5">&#9724; #c0caf5</span>                |

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

1. Make sure it has an IP, if not connect it.
2. Start SSH daemon - `sudo systemctl start sshd`
3. Enable SSH daemon - `sudo systemctl enable sshd`
4. Allow SSH in UWF: `sudo ufw allow 22/tcp`
5. Grab your IP: `ip a | grep "inet 192.168."`

### 2. Install Packages

Install [yay](https://github.com/Jguer/yay):

```bash
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
```

Install packages:

```
sudo pacman -S hyprland zsh kitty ly nodejs npm
```

```
yay -S rbenv
```

Install [oh-my-zsh](https://ohmyz.sh/#install)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install [starship](https://starship.rs/)

```
curl -sS https://starship.rs/install.sh | sh
```

(_optional_) Install [nvm](https://github.com/nvm-sh/nvm)

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

(_optional_) Install [macchina](https://github.com/Macchina-CLI/macchina/wiki/Installation)

```
cargo install macchina
```

### 3. Move config

**Script**:

1. Clone this repo: `git clone https://github.com/hrvdm/dots.git`
2. Make the script executable: `cd dots && chmod +x setup.sh`
3. Run the script: `./setup.sh`

**Manually**:

<div align="center">
<h2>📷 Screenshots</h2>
</div>

<div align="center">
<h2>📓 Credits</h2>
</div>

### **Thank you to the following people who have some awesome configs:**

#### [1amSimp1e](https://github.com/1amSimp1e/dots/tree/summer%E2%98%80%EF%B8%8F)

#### [k-vernooy](https://github.com/k-vernooy/dotfiles)

#### [saimoomedits](https://github.com/saimoomedits/dotfiles)

#### [JaKooLit](https://github.com/JaKooLit/Hyprland-Dots/tree/main)

#### [sameemul-haque](https://github.com/sameemul-haque/dotfiles)

#### [rxyhn](https://github.com/rxyhn/yoru)

<div align="center">
<h2>⚙️ Troubleshooting</h2>
</div>

<details>
  <summary>Troubleshooting</summary>
  
  ### Heading
  1. Foo
  2. Bar

### Some Javascript

```js
function logSomething(something) {
  console.log('Something', something)
}
```

</details>

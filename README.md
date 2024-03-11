<div align="center">
    <h1>🍣 hrvdm's dot's</h1>
    <h3><b>🚧 Please dont blindly execute or copy files.</b></h3>
    
[![](https://img.shields.io/github/repo-size/hrvdm/.dots?color=%23DDB&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=18181a)](https://github.com/hrvdm/.dots)
</div>

<div align="center">
<h2>📷 Screenshots</h2>
</div>

<div align="center">
<h2>🌿 Setup</h2>
</div>

### 1. Install Packages

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
sudo pacman -S hyprland xdg-desktop-portal-hyprland zsh kitty nodejs npm bluez bluez-utils pulseaudio pulseaudio-bluetooth dunst pipewire wireplumber polkit polkit-kde-agent ly socat jq
```

```
yay -S rbenv eww-wayland swww wofi pulseaudio-ctl flameshot firefox discord ttf-iosevka-nerd  noto-fonts-emoji ttf-jetbrains-mono wl-clipboard hyprpicker-git ttf-nerd-fonts-symbols visual-studio-code-bin neovim apple-fonts
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

_If you do not install the optional packages, edit the `.zshrc` in this repos /home/.zshrc_

**Enable services:**

```
systemctl enable ly.service
sudo systemctl enable bluetooth.service --now
sudo systemctl enable systemd-timesyncd.service --now
```

### 2. Clone & Move config

1. Clone this repo: `git clone https://github.com/hrvdm/dots.git`
   ```
   cd dots
   cp -r Wallpapers ../
   cd config && cp -r * ../../.config
   cd ../home && cp * ../../
   ```
2. Reboot: `sudo reboot`

<div align="center">
<h2>⚙️ Extras</h2>
</div>

  <details>
    <summary>My Arch install guide</summary>
<br>

**_If you have not installed arch before, I recommend following the [docs](https://wiki.archlinux.org/title/installation_guide)_**

I assume you already booted into the arch iso environment in UEFI mode.

### Check UEFI & WiFi

- Check UEFI mode: `ls /sys/firmware/efi/efivars`

1. Connect to wifi with [`iwctl`](https://wiki.archlinux.org/title/Iwd#iwctl)

- `iwctl`
- `device list`
- `station {DEVICE} scan`
- `station {DEVICE} get-networks`
- `station {DEVICE} connect {SSID}`

### Disk setup with LVM on LUKS

**Get available disks:**<br>
_For me it is /dev/sda_

- `lsblk`

**Setup partitions:**<br>
_For me it is fdisk /dev/sda_:<br>
If you get a warning like "Partition #X contains a vfat signature", press Y - **This will overwrite your disk**

- `fdisk /dev/{DISK}`
- **Create empty GPT partition:** `g`
- **Create the EFI partition:**

  `n`

  Partition Number: `PRESS ENTER`

  First Sector: `PRESS ENTER`

  Last sector: `+100M`

  `t`

  Type/Alias: `uefi`

- **Create the boot partition:**

  `n`

  Partition Number: `PRESS ENTER`

  First Sector: `PRESS ENTER`

  Last sector: `+512M`

  `t`

  _If prompted, select partition 2_

  Type/Alias: `linux`

- **Create the LUKS partition:**

  `n`

  Partition Number: `PRESS ENTER`

  First Sector: `PRESS ENTER`

  Last sector: `PRESS ENTER`

  `t`

  _If prompted, select partition 3_

  Type/Alias: `linux`

- **Check setup:** `p`

  This should print a table, the fields should be something like:

  | Device    | Size    | Type             |
  | --------- | ------- | ---------------- |
  | /dev/sda1 | 100M    | EFI System       |
  | /dev/sda2 | 512M    | Linux Filesystem |
  | /dev/sda3 | 930.9GB | Linux Filesystem |

- **Write changes to disk:** `w`

- **Format Partitions:**

  Replace DISK-EFI and DISK-BOOT with your EFI and boot partitions.<br>
  _For me this is /dev/sda1 and /dev/sda2_

  `mkfs.fat -F 32 /dev/{DISK-EFI}`

  `mkfs.ext4 /dev/{DISK-BOOT}`

- **Setup encrypted partition:**

  Replace DISK-LUKS with your LUKS partition.<br>
  _For me this is /dev/sda3_

  `cryptsetup --use-random luksFormat /dev/{DISK-LUKS}`

  `cryptsetup luksOpen /dev/{DISK-LUKS} cryptlvm`

- **Create LVM volume group:**

  `pvcreate /dev/mapper/cryptlvm`

  `vgcreate vg0 /dev/mapper/cryptlvm`

- **Create LVM partitions:**

  `lvcreate --size 34G vg0 --name swap` (RAM Size + 2GB)

  `lvcreate --size 100G vg0 --name root`

  `lvcreate -l +100%FREE vg0 --name home`

- **Format volumes:**

  `mkswap /dev/vg0/swap`

  `mkfs.ext4 /dev/vg0/root`

  `mkfs.ext4 /dev/vg0/home`

- **Mount filesystem:**

  Replace DISK-EFI and DISK-BOOT with your EFI and boot partitions.<br>
  _For me this is /dev/sda1 and /dev/sda2_

  `mount /dev/vg0/root /mnt`

  `mount --mkdir /dev/{DISK-EFI} /mnt/efi`

  `mount --mkdir /dev/{DISK-BOOT} /mnt/boot`

  `mount --mkdir /dev/vg0/home /mnt/home`

  `swapon /dev/vg0/swap`

### Pacstrap

Even if you do not plan to use `vim`, you need it for `visudo`. You can change this but it's easier to use vim for first install.

- **Run pacstrap:**

  `pacstrap -K /mnt base linux linux-firmware openssh git vim sudo nano networkmanager lvm2 reflector ufw base-devel rustup`

### Generate fstab

- `genfstab -U /mnt >> /mnt/etc/fstab`

### Enter system

If this throws an error, you might have mistyped something.

- `arch-chroot /mnt /bin/bash`

### Setup system

- **Timezone & Locale:**

  If your not in london, use `ls /usr/share/zoneinfo/` to get timezones.<br>

  `ln -s /usr/share/zoneinfo/Europe/London /etc/localtime`

  `hwclock --systohc`

  `cat /etc/locale.gen` (_You can `| grep {REGION}` i.e. `| grep en_GB`_)

  `echo "en_GB.UTF-8 UTF-8" > /etc/locale.gen`

  `locale-gen`

  `echo LANG={REGION} > /etc/locale.conf` (Replace {REGION} with your's i.e. en_GB.UTF-8)

- **Hostname:**

  `echo {YOUR-HOSTNAME} > /etc/hostname`

- **Create your user:**

  `useradd -m -G wheel --shell /bin/bash {USERNAME}`

  `passwd {USERNAME}` (If you use special chars, you might want to check their expected keys first)

  `visudo`

  - Enter write mode with `i`.
  - Uncomment `"%wheel ALL=(ALL:ALL) ALL"`
  - Press ESC to open command palette
  - Save and exit with `:w` then `:qa`.

- **Configure mkinitcpio:**

  `nano /etc/mkinitcpio.conf`

  - Add 'encrypt' and 'lvm2' to HOOKS before 'filesystems'

  `mkinitcpio -P`

- **Setup grub:**

  `pacman -S grub efibootmgr`

  If you error here, check your mount points

  `grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB`

  `nano /etc/default/grub`

  - Add (Change YOUR-LUKS): `GRUB_CMDLINE_LINUX="cryptdevice=/dev/{YOUR-LUKS}:cryptlvm root=/dev/vg0/root"`

  `grub-mkconfig -o /boot/grub/grub.cfg`

- **Enable networkmanager:**

  `systemctl enable NetworkManager`

- **Exit & Reboot:**

  `exit`

  `umount -R /mnt`

  `swapoff -a`

  `reboot`

<br>

**We are done!**

### Get a kernel panic?

Reboot to the install USB, unlock cryptlvm and remount, then fix whatever error occured.
Usually its a typo or missed step.

```
cryptsetup luksOpen /dev/{DISK-LUKS} cryptlvm

lsblk

mount /dev/vg0/root /mnt
mount --mkdir /dev/{DISK-EFI} /mnt/efi
mount --mkdir /dev/{DISK-BOOT} /mnt/boot
mount --mkdir /dev/vg0/home /mnt/home
swapon /dev/vg0/swap
```

  </details>

<details>
  <summary>Configure via SSH</summary>
<br>

If you want to SSH to your system after arch is installed:

1. Make sure it has an IP
   - if not connect it: `nmtui`.
2. Start SSH daemon - `sudo systemctl start sshd`
3. Enable SSH daemon - `sudo systemctl enable sshd`
4. Enable UFW: `sudo ufw enable`
5. Allow SSH in UWF: `sudo ufw allow 22/tcp`
6. Grab your IP: `ip a | grep "inet 192.168."`

**_Remember to disable this post-install_**

</details>

<details>
  <summary>Without ly DM</summary>
<br>

edit `~/.zlogin` and add

```sh
# Start window manager
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec Hyprland
fi
```

**_Remember to disable this post-install_**

</details>

<details>
  <summary>Optimisations</summary>
<br>

Mirror list:

```sh
sudo pacman -S reflector
sudo nano /etc/xdg/reflector/reflector.conf
sudo systemctl enable reflector.timer --now
```

Power for laptops:

```sh
sudo pacman -S thermald
yay -S auto-cpufreq
sudo systemctl enable thermald.service --now
sudo systemctl enable auto-cpufreq.service --now
```

SSD fstrim:

[Arch SSD Docs](https://wiki.archlinux.org/title/Solid_state_drive)

```sh
sudo systemctl enable fstrim.timer --now
```

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

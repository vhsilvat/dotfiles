![dotfiles](https://raw.githubusercontent.com/vhsilvat/dotfiles/master/pics/header.png)

## Particionamento de disco
```
sudo su
cgdisk (partição de boot 750MiB, root e home)
mkfs.ext4 /dev/nvme0n1p3	(home)
mkfs.ext4 /dev/nvme0n1p2	(root)
mkfs.fat -F32 /dev/nvme0n1p1	(boot)
```
## Montagem das partições
```
mount /dev/nvme0n1p2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/nvme0n1p1 /mnt/boot
mount /dev/nvme0n1p3 /mnt/home
```
## Instalação da base
```
basestrap /mnt base base-devel runit elogind-runit linux linux-firmware vim git jdk11-openjdk python3 networkmanager networkmanager-runit wget curl dhcpcd grub os-prober efibootmgr 
fstabgen -U /mnt >> /mnt/etc/fstab
```
## Configuração do sistema
```
artix-chroot /mnt
bash
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
vim /etc/locale.gen (descomentar pt_BR.UTF-8)
vim /etc/locale.conf (adicionar LANG=pt_BR.UTF-8)
vim /etc/vconsole.conf (adicionar KEYMAP=br-abnt2)
ln -s /etc/runit/sv/NetworkManager /etc/runit/runsvdir/current
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
```
## Configuração de usuário
```
passwd (senha root)
useradd -m victor
passwd victor
vim /etc/hosts (adicionar as 3 linhas abaixo)
127.0.0.1	localhost
::1		localhost
127.0.0.1	latitude.localhost latitude
sudo EDITOR=vim visudo
victor ALL=(ALL) ALL
```

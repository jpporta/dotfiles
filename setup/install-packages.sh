sudo pacman -Sy zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -Sy firefox
sudo pacman -Sy neovim
sudo pacman -Sy stow
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay waybar -Sy
sudo pacman -Sy unzip
sudo pacman -Sy nodejs
sudo pacman -Sy yarn
sudo pacman -Sy pavucontrol
sudo pacman -Sy neofetch zoxide
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/jpporta/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions /home/jpporta/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/jpporta/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sudo pacman -Sy pnpm
sudo pacman -Sy pnpm
sudo pacman -Sy man
sudo pacman -Sy lazygit

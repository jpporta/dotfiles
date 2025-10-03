# System
gsettings set org.gnome.desktop.interface color-scheme "prefer-$2"   # for GTK4 apps

# NVIM
cp "$HOME/.config/nvim/lua/jpporta/themes/$1-$2.lua" $HOME/.config/nvim/lua/jpporta/theme.lua

running=$(pgrep -f "nvim" | wc -l)
if [ $running -gt 1 ]; then
		for i in $(ls /tmp | grep nvim); do
			if [ -S "/tmp/$i" ]; then
				nvim --server /tmp/$i --remote-send "<Esc>:colorscheme $1<CR><Esc>:set background=$2<CR>" 2&>1 /dev/null &
			fi
		done
fi

# Kitty
cp "$HOME/.config/kitty/themes/$1-$2.conf" $HOME/.config/kitty/current-theme.conf
for i in $(pgrep -f "kitty"); do
		kill -SIGUSR1 $i & 
done

# Wallpapers
rm -r $HOME/dotfiles/Wallpaper
ln -s "$HOME/dotfiles/wallpapers/$1-$2" $HOME/dotfiles/Wallpaper
bash $HOME/.local/bin/wallpaper

# Hyprland
cp "$HOME/.config/hypr/themes/$1-$2.conf" $HOME/.config/hypr/colors.conf
hyprctl reload

# Waybar
cp "$HOME/.config/waybar/themes/$1-$2.css" $HOME/.config/waybar/global.css
killall waybar
waybar &



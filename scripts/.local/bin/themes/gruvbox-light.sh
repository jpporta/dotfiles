rm $HOME/.config/nvim/lua/jpporta/theme.lua
ln $HOME/.config/nvim/lua/jpporta/themes/gruvbox-light.lua $HOME/.config/nvim/lua/jpporta/theme.lua


running=$(ps -x | grep nvim | wc -l)
if [ $running -gt 1 ]; then
		nvim --server /tmp/nvim --remote-send '<Esc>:colorscheme gruvbox<CR><Esc>:set background=light<CR>'
fi

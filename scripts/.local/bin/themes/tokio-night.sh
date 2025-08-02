rm $HOME/.config/nvim/lua/jpporta/theme.lua
ln $HOME/.config/nvim/lua/jpporta/themes/tokio-night.lua $HOME/.config/nvim/lua/jpporta/theme.lua

running=$(ps -x | grep nvim | wc -l)
if [ $running -gt 1 ]; then
		nvim --server /tmp/nvim --remote-send '<Esc>:colorscheme tokyonight<CR><Esc>:set background=dark<CR>'
fi

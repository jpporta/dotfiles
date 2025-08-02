rm $HOME/.config/nvim/lua/jpporta/theme.lua
ln $HOME/.config/nvim/lua/jpporta/themes/catpuccin-mocha.lua $HOME/.config/nvim/lua/jpporta/theme.lua

running=$(ps -x | grep nvim | wc -l)
if [ $running -gt 1 ]; then
		nvim --server /tmp/nvim --remote-send '<Esc>:colorscheme catppuccin-mocha<CR><Esc>:set background=dark<CR>'
fi

#!/bin/bash

# mkdir in user .SeemZ/ 
# cp /bin 
# create theme.list and theme.active
# done, so here we go :) 
mkdir "$HOME/.SeemZ/"
mkdir "/etc/seemz"
touch "$HOME/.SeemZ/theme.list"
touch "$HOME/.SeemZ/theme.active"
chmod +x "SeemZ.py"
chmod +x "seemz-cli.sh"
chmod +x "seemz.glade"
cp "SeemZ.py" "/bin/seemz"
cp "seemz-cli.sh" "/bin/seemz-cli"
cp "seemz.glade" "/etc/seemz/"

# SEEMZ
## Choose theme from a desktop icons and menu on linux
introduction :
SEEMZ uses text file to read line by line your themes and print menu item in consequence, then it call a bash script to switch on your preset theme with a random wallpaper found in the folder of this theme.
- dependances
  - <a href="https://github.com/themix-project/oomox">oomox</a> theme designer, it's a theme and icons generator.
  - <a href="https://github.com/dylanaraps/pywal">pywall</a> Generate and change color-schemes (terminal and wallpaper) on the fly.
- How To
  - create some theme with oomox, rename them as  => oomox-themetype-wallpaperName as themetype is the name of your parent folder for your wallpapers in ~/.SeemZ
    ###example :

``` shell
$ ls -R .SeemZ/
.SeemZ/:
aenami  cyber  script.over  theme.active  theme.list

.SeemZ/aenami:
eclipse_rouge_clair.jpg  eclipse_rouge.jpg

.SeemZ/cyber:
ghost_in_shell.jpg
#ls of oomox's users folders
$ls .themes/
oomox-aenami-eclipse_rouge        oomox-cyber-ghost_in_shell        oomox-aenami-eclipse_rouge_clair

```
  - check in install folder from the repo, then run setup.sh, finally write in theme.list your themes line by line.
preset themes for test can be found in themes_example, ready to be import in oomox with *index.theme* file 

## Note :
If you want to "rollback" your theme check at **lxappearance** command. Also i've tried seemz only on manjaro i3, shit can happen :/ 

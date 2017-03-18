# dsearch

## installation
make install
Will install to /usr/local/bin, and /usr/local/share/dsearch

## configuration
To pipe additional content in to the menu, dsearch will source $XDG_CONFIG_HOME/dsearch/entriesrc, running each line in that file and piping (in order) those items in. It's the first thing sourced, so your items show up with precedence.
Be sure to include logic for handling your entries, which would be found in $XDG_CONFIG_HOME/dsearch/handlersrc
This is wired heavily into [my plumber](https://github.com/halfwit/plumber) and also expects to find youtube API keys in $XDG_DATA_HOME/youtube/key and $XDG_DATA_HOME/youtube/imid

### Example entriessrc

```sh
# Last selection
xcmenu --list | head -n 1

# List bookmark dir
cd $XDG_DATA_HOME/bookmark" || exit 1
find -not -path '*/\.*' -type f -printf "%f\n" 

# Arbitrary file selection
find ~/ -type f ! -name *.git*
```

### Example handlersrc

```sh
# Set our default handlers
browse=firefox
play=mpv
view=sxiv
docs=zathura
edit=st -e vim
hear=mpv

# Case match anything that we emit in entriesrc
case "$input" in
	browse\ -\ *)   read -r result < "$XDG_DATA_HOME/bookmark/$input"
					exec browse "$result" ;;
esac
```

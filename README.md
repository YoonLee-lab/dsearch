# dsearch

## installation
make install
Will install to /usr/local/bin, and /usr/local/share/dsearch

## configuration
Dsearch will, by default pipe the contents of your ~/ path, less any .git directories, as well as entries for each handler in your handlerbin.
To pipe additional content in to the menu, dsearch will source $XDG_CONFIG_HOME/dsearch/entries.rc, running each line in that file and piping (in order) those items in. It's the first thing sourced, so your items show up with precedence.

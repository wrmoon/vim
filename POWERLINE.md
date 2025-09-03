# Powerline setup
`sudo apt install pip3 powerline powerline-gitstatus`
* had to manually fix bad python code (ubuntu picked up an older version of powerline, that had issues with python 3.12
* lots of "SyntaxWarnings" about invalid escape sequences. Needed to add r prefix.

# Fonts
See https://github.com/powerline/fonts 
```
git clone git@github.com:powerline/fonts.git
cd fonts
./install.sh
```
* restart terminal, chose source code pro for powerline
* in .bashrc, add:
```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
```


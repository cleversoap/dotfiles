##zsh
Run `zsh/setup` to install zgen and prezto. This will create the .zsh directory.

##env
Run `zsh/setup` to install nodenv, rbenv, pyenv, luaenv, jenv, and exenv.

##clv
This contains the clv functions and creates the .clv directory.

##vim
Run `zsh/setup` to install NeoBundle

### Notes
There is no **.zshrc** file, instead the files are meant to be sourced into a
user's **.zshrc**

The following directories are created in order to be used in the path.

There is an order dependency to make things useful.

Some directories contain a "setup" script, this will install certain
dependencies - this script will not be linked by stow as per the stow ignore
file.

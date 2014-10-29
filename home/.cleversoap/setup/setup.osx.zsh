# Brew libraries
set -e

# Dirs
mkdir -p ~/projects
mkdir -p ~/vendor

# Homebrew
brew tap homebrew/dupes
brew tap caskroom/cask
brew update
brew install brew-cask

# Libs
brew install curl
brew install zlib
brew install readline
brew install openssl
brew install libyaml
brew install autoconf
brew install mercurial
brew install sqlite
brew cask install xquartz

# Install envs
source $HOME/.cleversoap/setup/env.zsh

# Install apps
# vim
if [ ! -d ~/vendor/macvim ]; then
    export vi_cv_path_python_plibs="-L/Users/mclever/.pyenv/versions/`cat ~/.pyenv/version`/lib -lpython2.7"
    git clone https://github.com/b4winckler/macvim.git ~/vendor/macvim
    cd ~/vendor/macvim/src && ./configure --enable-pythoninterp=yes --enable-rubyinterp=yes --enable-luainterp=yes --with-lua-prefix=$HOME/.luaenv/versions/`cat $HOME/.luaenv/version` --enable-cscope --with-features=huge && make -j4 && sudo make install
fi

# vim plugins
if [ ! -d ~/.vim ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    vim +NeoBundleUpdate
fi


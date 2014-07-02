#-------------------------------------------------------------------------------

# rbenv
RBENV_VERSIONS=(2.1.0 2.2.0-dev jruby-1.7.11)
if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    mkdir ~/.rbenv/cache
fi

# pyenv
PYENV_VERSIONS=(2.7.6)
if [ ! -d ~/.pyenv ]; then
    git clone git://github.com/yyuu/pyenv.git .pyenv
    mkdir ~/.pyenv/cache
fi

# nodenv
NODENV_VERSIONS=(0.10.3 0.11.11)
if [ ! -d ~/.nodenv ]; then
    git clone https://github.com/OiNutter/nodenv.git ~/.nodenv
    git clone git://github.com/OiNutter/node-build.git ~/.nodenv/plugins/node-build
    mkdir ~/.nodenv/cache
fi

# luanev
LUAENV_VERSIONS=(5.2.3 luajit-2.0-dev)
if [ ! -d ~/.luaenv ]; then
    git clone https://github.com/cehoffman/luaenv.git ~/.luaenv
    git clone git://github.com/cehoffman/lua-build.git ~/.luaenv/plugins/lua-build
    mkdir ~/.luaenv/cache
fi

# jenv
# This is usually managed later as java downloads are not so easily managed
# automatically and system version locations vary wildly.
if [ ! -d ~/.jenv ]; then
    git clone https://github.com/gcuisinier/jenv.git ~/.jenv
    mkdir ~/.jenv/cache
fi

#-------------------------------------------------------------------------------

# Resource shell so that env functions are available
source $HOME/.zshrc

#-------------------------------------------------------------------------------

# Install Versions
for r in $RBENV_VERSIONS
do
    rbenv install $r
    rbenv rehash
done

for p in $PYENV_VERSIONS
do
    pyenv install $p
    pyenv rehash
done

for n in $NODENV_VERSIONS
do
    nodenv install $n
    nodenv rehash
done

for l in $LUAENV_VERSIONS
do
    luanev install $l
    luaenv rehash
done

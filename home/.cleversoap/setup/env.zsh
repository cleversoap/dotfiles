#-------------------------------------------------------------------------------

# rbenv
RBENV_VERSIONS=('2.1.0' '2.2.0-dev')
if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    mkdir ~/.rbenv/cache
fi

# pyenv
PYENV_VERSIONS=('2.7.6')
if [ ! -d ~/.pyenv ]; then
    git clone git://github.com/yyuu/pyenv.git .pyenv
    mkdir ~/.pyenv/cache
fi

# nodenv
NODENV_VERSIONS=('0.10.3' '0.11.11')
if [ ! -d ~/.nodenv ]; then
    git clone https://github.com/OiNutter/nodenv.git ~/.nodenv
    git clone git://github.com/OiNutter/node-build.git ~/.nodenv/plugins/node-build
    mkdir ~/.nodenv/cache
fi

# luanev
LUAENV_VERSIONS=('5.2.3')
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

# Install Versions
for r in ${RBENV_VERSIONS[@]}; do
    if [ ! -d ~/.rbenv/versions/$r ]; then
        echo "> rbenv install $r"
        rbenv install $r
        rbenv rehash
    fi
done
rbenv global ${RBENV_VERSIONS[0]}

for p in ${PYENV_VERSIONS[@]}; do
    if [ ! -d ~/.pyenv/versions/$p ]; then
        echo "> pyenv install $p"
        CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install -v $p
        pyenv rehash
    fi
done
pyenv global ${PYENV_VERSIONS[0]}
# Link hack for references to Python/* when including
if ls ~/.pyenv/versions/2.7.* > /dev/null 2>&1; then
    p2v=`pyenv whence python2` 
    ln -sfn ~/.pyenv/versions/$p2v/include/python2.7/ ~/.pyenv/versions/$p2v/include/python2.7/Python
fi

for n in ${NODENV_VERSIONS[@]}; do
    if [ ! -d ~/.nodenv/versions/$n ]; then
        echo "> nodenv install $n"
        nodenv install $n
        nodenv rehash
    fi
done
nodenv global ${NODENV_VERSIONS[0]}

for l in ${LUAENV_VERSIONS[@]}; do
    if [ ! -d ~/.luaenv/versions/$l ]; then
        echo "> luaenv install $l"
        luaenv install $l
        luaenv rehash
    fi
done
luaenv global ${LUAENV_VERSIONS[0]}

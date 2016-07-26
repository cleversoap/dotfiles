#Neovim
This neovim config uses the XDG spec for both config and data - the init.vim
will go into $XDG_CONFIG_HOME/nvim and the plugin bundles (and any other data)
will go into $XDG_DATA_HOME/nvim

This config uses dein to handle plugins.

There are several optional tools that this config will make use of if found.
After installing any of these tools make sure to call dein#update to download
the now usable plugin.

   - **ghc-mod** will activate *neco-ghc* for *haskell* files
   - **vim-vint** will activate automatic linting for *vim* files (via Neomake)

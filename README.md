This is all a work in progress, especially the shells, and things may not always match up to this README but for the most part I want to explain the choices I've made and have them be critiqued.

# Vim Plugins
I've changed from using Pathogen to manage everything and have switched to Vundle as it provides everything I was using Pathogen for automatically without having to manually maintain git submodules. 

- __NerdTree__
	- I like having handy access on a shortcut, less so for actual navigating and opening files (I prefer CtrlP for that) but just so I can see directory structure and dive in if I need to. There are occasionally conflicts with DWM taking control of the NerdTree window but that's mostly me using it clumsily than either plugin's fault.
	- [https://github.com/scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
	
- __GUndo__
	- I only need this maybe once a week but when I do it comes in tremendously handy. To be able to jump around edit history can be a sanity saver.
	- [https://github.com/sjl/gundo.vim/](https://github.com/sjl/gundo.vim/)
	
- __DWM__
	- Plugin to do what I was essentially doing with all my buffers anyways, just easier.
	- [https://github.com/spolu/dwm.vim](https://github.com/spolu/dwm.vim)
	
- __Tabular__
	- I am actually addicted to this plugin and it has definitely improved my code readability; primarily because I now avoid 99% of misalignments due to tabbing when I should be using spaces.
	- [https://github.com/godlygeek/tabular](https://github.com/godlygeek/tabular)
	
- __EasyMotion__
	- Primarily used for quick and precise highlighting in visual mode, I haven't fit it into my regular navigation pipeline but that's more to do with the way I break code up when I edit than a weakness on the part of the plugin.
	- [https://github.com/Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
	
- __FSwitch__
	- This is a feature that I really liked with XCode and I wanted it in Vim. Being able to switch quickly from header to implementation saves me a buffer window.
	- [https://github.com/derekwyatt/vim-fswitch](https://github.com/derekwyatt/vim-fswitch)
	
- __Fugitive__
	- I genuinely have only used this maybe… once? Twice? Regardless, several plugins make use of it (eg. Powerline) and I am much happier doing all my git work from the command line.
	- [https://github.com/tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
	
- __CtrlP__
	- As the size of a project grows a good naming scheme and this plugin's fuzzy search can make debugging and investigating code good. Works particularly well if you don't have an autocomplete or documentation ready as you can quickly zoom to the file you want.
	- [https://github.com/kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
	
- __Powerline__
	- I had used vim-powerline before with some success and I liked its lightweight nature. I was hesitant at first to incorporate the new system wide version but I gave it a shot and I'm glad I did because it works just as well as well as its predecessor with the added bonus of ongoing support, modern API, and actually working fonts (from the font pack). A simple install and I've had no issues updating it since.
	- [https://github.com/Lokaltog/powerline](https://github.com/Lokaltog/powerline)

- __vim-actionscript__
	- I needed it and this one appeared to be the most feature complete. Only offers syntax highlighting but I'd rather not mess around with incomplete plugins offering [FlashDevelop](http://www.flashdevelop.org/) like functionality, no matter how awesome that would be...
	- [https://github.com/jeroenbourgois/vim-actionscript](https://github.com/jeroenbourgois/vim-actionscript)

- __Tomorrow Theme__
	- It's goddamn gorgeous that's why. I had previously used [JellyBeans](https://github.com/nanotech/jellybeans.vim) in terminal only but I'm going for uniformity now and it's working fine.
	- [https://github.com/chriskempson/vim-tomorrow-theme](https://github.com/chriskempson/vim-tomorrow-theme)
	
## Removed Plugins
I've also removed some plugins since I started condensing my dotfiles…

- __YouCompleteMe__
	- I really really really wanted this one to work, I was just starting in on a massive C++ project and I hadn't ever really used a completion plugin before. This one got good reviews and when it was setup and working it was very fast. Updating it however is slow, breaks easily (particularly with MacVim), and it's absolutely massive.
	
- __Conque Term__
	- I have no idea what happened but all of a sudden this one stopped working and it became *extremely* difficult to exit once input mode was activated on the Conque buffer. I used to use it extensively as a sort of "tmux lite" but now it's unusable as anything.
	
- __Syntastic__
	- Really only used it with YouCompleteMe, it was very slow to use and would often highlight code incorrectly or give flat out bizarre errors. Also was not good with preprocessor directives such as ```#pragma once```
	
# Shells

- __fish__
	- I decided to try fishfish (via homebrew). To be continued...
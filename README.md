# Vim configuration & plugins

### Installing

Based on http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

```
git clone http://github.com/dudarev/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd .vim
git submodule init
git submodule update
```

### When new submodule is installed in remote
```
git submodule update --init --recursive
```

### Update all bundled modules
```
git submodule foreach git pull origin master
```
### Install a new bundle
```
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```
### To remove a submodule
1. Delete the relevant section from the .gitmodules file.
1. Delete the relevant section from .git/config.
1. Run git rm --cached path_to_submodule (no trailing slash).
1. Commit and delete the now untracked submodule files.

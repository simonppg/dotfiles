# Archivos de configuración

## Crear enlaces simbolicos:

```shell
$ ln -s ~/dotfiles/zshrc ~/.zshrc
$ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
$ ln -s ~/dotfiles/alias.zsh ~/.oh-my-zsh/lib/alias.zsh
```

## zsh
### instalación de zsh
```shell
$ sudo apt-get install zsh
$ chsh -s /bin/zsh
$ exec /bin/zsh --login
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

# Run .Xresources if X is started through startx
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xsetroot -name "kj"

# Window Managers
session=${1:-dwm}

case $session in
	dwm				) exec dwm;;
	i3|i3wm				) exec i3;;
	*				) exec $1;;
esac

# Forcfully tell X to use Powerline fonts
xset +fp ~/.local/share/fonts/AnonymousPro
xset +fp ~/.local/share/fonts/DejaVuSansMono
xset +fp ~/.local/share/fonts/DroidSansMono
xset +fp ~/.local/share/fonts/InconsolataDz
xset +fp ~/.local/share/fonts/Inconsolata
xset +fp ~/.local/share/fonts/LiberationMono
xset +fp ~/.local/share/fonts/Meslo
xset +fp ~/.local/share/fonts/SourceCodePro
xset +fp ~/.local/share/fonts/Terminus/BDF
xset +fp ~/.local/share/fonts/Terminus/PCF
xset +fp ~/.local/share/fonts/UbuntuMono
xset fp rehash

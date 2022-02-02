abbr -a yr 'cal -y'
abbr -a o 'xdg-open'
abbr -a paci 'yay -S'
abbr -a cx 'xclip -selection clipboard'

set -U fish_greeting ""
bind \cs 'fish_commandline_prepend sdf'


function apush
  adb push $argv /storage/self/primary/
end

function apull
  adb pull /storage/self/primary/$argv .
end

function mntusb
  sudo mount -o umask=0 /dev/sdc1 /run/media/bourbon/usb
  cd /run/media/bourbon/usb
end

function umntusb
  sudo umount /run/media/bourbon/usb
end

function d
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end

abbr -a yr 'cal -y'
abbr -a o 'xdg-open'
abbr -a gc 'gh gist create -w'
abbr -a bs 'batstat'
abbr -a paci 'yay -S'
abbr -a cx 'xclip -selection clipboard'


abbr -a g git
abbr -a ga 'git add -p'
abbr -a gc 'git checkout'
abbr -a gp 'git push' 
abbr -a gs 'git status'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'

set -U fish_greeting ""
set -U EDITOR nvim
bind \cs 'fish_commandline_prepend sdf'

function apush
  adb push $argv /storage/self/primary/
end

function apull
  adb pull /storage/self/primary/$argv .
end

function mntusb
  sudo mount -o umask=0 /dev/sda1 /run/media/bourbon/usb
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

# Bun
set -Ux BUN_INSTALL "/home/bourbon/.bun"
set -px --path PATH "/home/bourbon/.bun/bin"


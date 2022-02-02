function pacinst --wraps='sudo pacman -S' --description 'alias pacinst sudo pacman -S'
  sudo pacman -S $argv; 
end

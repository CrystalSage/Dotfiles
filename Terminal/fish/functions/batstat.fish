function batstat --wraps='cat /sys/class/power_supply/BAT0/capacity' --description 'alias batstat cat /sys/class/power_supply/BAT0/capacity'
  cat /sys/class/power_supply/BAT0/capacity $argv; 
end

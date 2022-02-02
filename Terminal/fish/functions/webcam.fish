function webcam --wraps='v4l2-ctl -d /dev/video0 -c power_line_frequency=1,brightness=164,contrast=22,saturation=38' --description 'alias webcam v4l2-ctl -d /dev/video0 -c power_line_frequency=1,brightness=164,contrast=22,saturation=38'
  v4l2-ctl -d /dev/video0 -c power_line_frequency=1,brightness=164,contrast=22,saturation=38 $argv; 
end

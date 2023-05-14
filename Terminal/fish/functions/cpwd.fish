function cpwd --wraps=pwd\ \|\ tr\ -d\ \"\\n\"\ \|\ xclip\ -selection\ clipboard --description alias\ cpwd\ pwd\ \|\ tr\ -d\ \"\\n\"\ \|\ xclip\ -selection\ clipboard
  pwd | tr -d "\n" | xclip -selection clipboard $argv
        
end

#!/usr/bin/ruby

filelist = [
  ".bash_profile",
  ".bashrc",
  ".emacs",
  ".gnuplot",
  ".lesskey",
  ".screenrc",
  ".tmux.conf",
  ".gitconfig"
]


def func(filename)
  home = ENV['HOME'].chomp
  target = "#{home}/#{filename}"
  
  `unlink #{target}`
end


# main routine
for i in 0..filelist.size()-1
  puts "Unlinking #{filelist[i]}"
  func filelist[i]
end





#!/usr/bin/ruby

filelist = [
  ".bash_profile",
  ".bashrc",
  ".emacs",
  ".gnuplot",
  ".lesskey",
  ".screenrc",
  ".tmux.conf",
  ".gitconfig",
  ".gitconfig_user",
  ".gitignore_global"
]


def func(filename)
  home = ENV['HOME'].chomp
  target = "#{home}/#{filename}"
  pwd = `pwd`.chomp
  
  if File.exist?(target)
    puts "#{target} exists. Instllation canceled."
   
  else
    `ln -s #{pwd}/#{filename} #{target}`
    puts "done" 
  end
end


# main routine
for i in 0..filelist.size()-1
  puts "Installing #{filelist[i]}"
  func filelist[i]
end





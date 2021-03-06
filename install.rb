#!/usr/bin/ruby

def load_list()
  filelist = []
  open("dotfiles.list").each do |line|
    line = line.chomp
    if line[0] == '#'
      next
    end
    filelist.push(line)
  end
  return filelist
end

def link(filename)
  home = ENV['HOME'].chomp
  target = "#{home}/#{filename}"
  pwd = `pwd`.chomp
  
  if File.exist?(target)
    puts "#{target} exists. Installation canceled."
   
  else
    `ln -s #{pwd}/#{filename} #{target}`
    puts "done" 
  end
end


# main routine
filelist = load_list
for i in 0..filelist.size()-1
  puts "Installing #{filelist[i]}"
  link filelist[i]
end





#!/usr/bin/ruby

def load_list()
  filelist = []
  open("dotfiles.list").each do |line|
    filelist.push(line.chomp)
  end
  return filelist
end

def unlink(filename)
  home = ENV['HOME'].chomp
  target = "#{home}/#{filename}"
  
  `unlink #{target}`
end


# main routine
filelist = load_list
for i in 0..filelist.size()-1
  puts "Unlinking #{filelist[i]}"
  unlink filelist[i]
end





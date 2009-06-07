require 'rubygems'

# A couple of suggestions from Dr. Nic
#require 'map_by_method'
#require 'what_methods'

# Adds colorization, PP, and ri support
require 'wirble'
Wirble.init
Wirble.colorize

# From the Pick Axe
def show_regexp(a,re)
  if a =~ re
    "#{$`}<<#{$&}>>#{$'}"
  else
    "no match"
  end
end

class Regexp
  def show_match(a)
    show_regexp(a,self)
  end
end

def surround(str)
  ">>>>>>>>>>>" + str + "<<<<<<<<<<<"
end


# Save irb history between sessions
require 'irb/ext/save-history'

# Simple ri integration
def ri(*names)
  system("ri #{names.map {|name| name.to_s}.join(" ")}")
end

# From the Pick Axe - makes for pretty prompts
IRB.conf[:IRB_RC] = lambda do |conf| 
leader = " " * conf.irb_name.length 
conf.prompt_i = "#{conf.irb_name} --> " 
conf.prompt_s = leader + ' \-" ' 
conf.prompt_c = leader + ' \-+ ' 
conf.return_format = leader + " ==> %s\n\n" 
conf.auto_indent_mode = true
puts "Welcome!" 
end 


if ENV['RAILS_ENV']
  load File.dirname(__FILE__) + '/.railsrc'
end


class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

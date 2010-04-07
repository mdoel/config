require 'rubygems'

# A couple of suggestions from Dr. Nic
#require 'map_by_method'
#require 'what_methods'

# Adds colorization, PP, and ri support
require 'wirble'
Wirble.init
Wirble.colorize
require 'ap'
require 'pp'

require 'string_to_editor'

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

script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers')
rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))
irb_standalone_running = !script_console_running && !rails_running

if script_console_running
  require 'logger'
  Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
end


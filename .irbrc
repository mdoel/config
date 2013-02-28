require 'rubygems'

# A couple of suggestions from Dr. Nic
#require 'map_by_method'
#require 'what_methods'

# Adds colorization, PP, and ri support
# require 'wirble'
# Wirble.init
# Wirble.colorize
# 
# require 'hirb'
# Hirb::View.enable
# 
# require 'ap'
# require 'pp'
# 
# unless IRB.version.include?('DietRB')
#   IRB::Irb.class_eval do
#     def output_value
#       ap @context.last_value
#     end
#   end
# else # MacRuby
#   IRB.formatter = Class.new(IRB::Formatter) do
#     def inspect_object(object)
#       object.ai
#     end
#   end.new
# end


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
# IRB.conf[:IRB_RC] = lambda do |conf| 
# leader = " " * conf.irb_name.length 
# conf.prompt_i = "#{conf.irb_name} --> " 
# conf.prompt_s = leader + ' \-" ' 
# conf.prompt_c = leader + ' \-+ ' 
# conf.return_format = leader + " ==> %s\n\n" 
# conf.auto_indent_mode = true
# puts "Welcome!" 
# end 

if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  #IRB.conf[:USE_READLINE] = true

  # Display the RAILS ENV in the prompt
  # ie : [Development]>> 
  IRB.conf[:PROMPT][:CUSTOM] = {
   :PROMPT_N => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
   :PROMPT_I => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
   :PROMPT_S => nil,
   :PROMPT_C => "?> ",
   :RETURN => "=> %s\n"
   }
  # Set default prompt
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end


if ENV['RAILS_ENV']
  load File.dirname(__FILE__) + '/.railsrc'
end


def me
  User.find_by_email 'mike@mikedoel.com'
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


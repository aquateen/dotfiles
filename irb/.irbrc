require "rubygems"
require "ap"
require 'interactive_editor'
require 'irb/completion'
require 'irb/ext/save-history'
require 'fancy_irb'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

ActiveRecord::Base.logger.level = 1 if defined? ActiveRecord::Base

def y(obj)
  puts obj.to_yaml
end

class Object
  def vim(method_name)
    file, line = method(method_name).source_location
    `vim +#{line} '#{file}'`
  end
end

# Break out of the Bundler jail
# from https://github.com/ConradIrwin/pry-debundle/blob/master/lib/pry-debundle.rb
if defined? Bundler
  Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
  Gem::Specification.reset
  load 'rubygems/custom_require.rb'
end

if defined? Rails
  begin
    require 'hirb'
    Hirb.enable
  rescue LoadError
  end
end
require 'irb/completion'

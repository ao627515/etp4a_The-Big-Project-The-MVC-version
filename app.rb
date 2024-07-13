require 'bundler'
Bundler.require
$:.unshift File.expand_path('./lib', __dir__)

# puts($LOAD_PATH.select { |item| item.include?('lib') }[0])

require 'router'

Router.new.perform

# binding.pry

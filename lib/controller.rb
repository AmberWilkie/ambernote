require 'bundler'
Bundler.require
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }
# require_relative 'helpers/data_mapper'
# require_relative 'helpers/warden'
require 'pry'

get '/' do
  "Hello Amber!"
end

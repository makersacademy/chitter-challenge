ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'bcrypt'
require File.join(File.dirname(__FILE__), 'lib', 'data_mapper_setup.rb')
require File.join(File.dirname(__FILE__), 'lib', 'user.rb')
require File.join(File.dirname(__FILE__), 'lib', 'message.rb')
require File.join(File.dirname(__FILE__), 'lib', 'printer.rb')

require_relative 'server.rb'
require_relative 'controllers/main.rb'
require_relative 'controllers/users.rb'
require_relative 'controllers/sessions.rb'
require_relative 'controllers/messages.rb'

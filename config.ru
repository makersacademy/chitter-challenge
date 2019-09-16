
require_relative 'controller/user_controller'
require_relative 'controller/web_controller'
require 'data_mapper'
require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://rafaela@127.0.0.1/chitter')
DataMapper.auto_migrate!

map('/') { run WebController }
map('/user') { run UserController }

require './lib/user'
require './lib/message'
require './lib/comment'
require './lib/comment_message'
require './lib/messaging'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
DataMapper.finalize

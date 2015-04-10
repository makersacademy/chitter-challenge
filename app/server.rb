require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/blabber_#{env}")

require_relative 'models/blabbs'

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do
  @blabbs = Blabbs.all
  erb :index
end

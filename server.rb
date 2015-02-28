require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter#{env}")


require './lib/chit'

DataMapper.finalize 

DataMapper.auto_upgrade!

get '/' do
  @chit = Chit.all
  erb :index
end
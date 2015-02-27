require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/tweet'

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do
  @tweets = Tweet.all
  erb :index
end
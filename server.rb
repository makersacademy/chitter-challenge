require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chiter_#{env}")

require './lib/tweet'

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do
  @tweets = Tweet.all
  erb :index
end

post '/tweets' do
  message = params['message']
  user = params['user']
  Tweet.create(message: message, user: user)
  redirect to('/')
end

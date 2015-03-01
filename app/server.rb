require 'data_mapper'
require 'rack-flash'
require 'sinatra'
require 'sinatra/partial'
require './app/lib/tweet'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do 
  @tweets = Tweet.all
  erb :index
end

post '/tweets' do
  post = params["post"]
  user = params["user"]
  Tweet.create(:post => post, :user => user)
  redirect to('/')
end
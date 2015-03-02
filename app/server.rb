require 'data_mapper'
require 'rack-flash'
require 'sinatra'
require 'sinatra/partial'

require './app/lib/tweet'
require './app/lib/user'
require_relative 'helpers/application'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'

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

get 'users/new' do 
  erb :"users/new"
end

post '/users' do
  user = User.create(:email => params[:email], :password => params[:password], :name => params[:name], :username => params[:username])
  session[:user_id] = user.id
  redirect to('/')
end
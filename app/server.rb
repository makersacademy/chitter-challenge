require 'sinatra'
require 'data_mapper'
require './app/lib/tweet'
require_relative 'helpers/application'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/lib/tweet'
require './app/lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super awesome secret password'

get '/' do
  @tweets = Tweet.all
  erb :index
end

post '/tweets' do
  message = params["message"]
  user = params["user"]
  Tweet.create(:message => message, :user => user)
  redirect to('/')
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  user = User.create(:email => params[:email],
                     :password => params[:password],
                     :password_confirmation => params[:password_confirmation],
                     :name => params[:name],
                     :username => params[:username])
  session[:user_id] = user.id
  redirect to('/')
end
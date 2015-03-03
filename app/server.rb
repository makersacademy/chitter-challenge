require 'data_mapper'
require 'rack-flash'
require 'sinatra'
require 'sinatra/partial'

require './app/lib/tweet'
require './app/lib/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

env = ENV['RACK_ENV'] || 'development'

include SessionHelpers

set :partial_template_engine => :erb
register Sinatra::Partial

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride

get '/' do 
  @tweets = Tweet.all
  erb :index
end

post '/tweets' do
  post = params["post"]
  @user = params["user"]
  Tweet.create(:post => post, :user => @user)
  redirect to('/')
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(:email => params[:email], :password => params[:password], :name => params[:name], :username => params[:username], :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/sessions/new' do 
  erb :"sessions/new"
end

post '/sessions' do 
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ["The email or password is incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do 
  session.clear
  redirect to('/')
  erb :index
end
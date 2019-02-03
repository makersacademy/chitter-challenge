require 'sinatra/base'
require './lib/user'
require './lib/chits'
require './lib/loggedin'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  set :bind, '0.0.0.0'

  database_setup

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  get '/login/success' do
    @user = User.all
    erb :test
  end

  get '/signup' do
    erb :signup
  end

  get '/signup/success' do
    User.signup(firstname: params[:firstname], username: params[:username], password: params[:password], display_pic: params[:display_pic], email: params[:email])
    redirect '/'
  end

 get '/home' do
   @user = User.login($loggedin.username)
   @chits = Chits.all
    erb :home
end

post '/home/add_chit' do
  Chits.create(message: params[:message], date: Time.new, user_id: params[:user_id], image: params[:image])
   redirect '/home'
end

post '/home/delete_chit' do
  Chits.delete(id: params[:delete_chit])
   redirect '/home'
end

post '/loginuser' do
  $loggedin = Loggedin.new(username: params[:username], password: params[:password])
   redirect '/home'
end

get '/logout' do
$loggedin.logout
redirect '/'
end

run! if app_file == $0
end

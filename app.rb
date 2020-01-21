require 'sinatra/base'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions 
 # look up session_secret

  get '/' do
    erb :landing
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/user-sign-up' do
    @user = User.create(params)
    p @user
    session[:username] = params[:username]
    redirect '/home'
  end

  get '/log-in' do
    erb :login
  end

  get '/home' do
    @username = session[:username]
    erb :home
  end

  get '/sign-out' do

    redirect '/'
  end

  
end

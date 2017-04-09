ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative '../app/models/user'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  get '/users/new' do
    erb :'new'
  end

  post '/users/new' do
    User.create(email: params[:email] ,password: params[:password])
    flash.next[:notice] = "Welcome, #{params[:email]}"
    redirect '/index'
  end

  get '/index' do
    erb :'index'
  end


end

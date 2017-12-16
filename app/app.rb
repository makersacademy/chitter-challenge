require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'helpers'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, "Only somewhat secret, honestly"
  data_mapper_setup

  get '/' do

  end

  get '/chit' do
    @name = current_user.first_name
    erb :chit
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(params)
    if user.save
      session[:user_id] = user.id
      redirect '/chit'
    else
      flash.next[:error] = user.errors.full_messages.join("<br>").sub("hash ","")
      redirect '/sign_up'
    end
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    user = User.first(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/chit'
    else
      flash.next[:error] = "Login failed. Please check your username and password."
      redirect '/sign_in'
    end
  end

end

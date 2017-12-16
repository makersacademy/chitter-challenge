require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require_relative 'models/user'
require_relative 'helpers'

class Chitter < Sinatra::Base
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
    session[:user_id] = user.id
    redirect '/chit'
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    user = User.first(email: params[:email])
    session[:user_id] = user.id
    redirect '/chit'
  end

end

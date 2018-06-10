require 'sinatra/base'
require './database_connection_setup'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'hello world'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(
      email: params['email'],
      username: params['username'],
      name: params['name'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/new_user_confirmation'
  end

  get '/new_user_confirmation' do
    @user = User.find(session[:user_id])
    erb :new_user_confirmation
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    user = User.authenticate(
      params['username'],
      params['password']
      )
    if user
      session[:user_id] = user.id
      redirect('/sign_in_confirmation')
    else
      @error = true
      erb :sign_in
    end
  end

  get '/sign_in_confirmation' do
    @user = User.find(session[:user_id])
    erb :sign_in_confirmation
  end

  run! if app_file == $0
end

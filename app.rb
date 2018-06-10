require 'sinatra/base'
require './database_connection_setup'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @title = 'Chitter'
    @user = User.find(session[:user_id])
    if @user
      erb :index
    else
      redirect '/sign_in'
    end
  end

  get '/signup' do
    @title = 'Chitter sign up'
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
    @title = 'Login success!'
    @user = User.find(session[:user_id])
    erb :new_user_confirmation
  end

  get '/sign_in' do
    @title = 'Chitter sign in'
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
      @title = 'Chitter Sign in'
      @error = true
      erb :sign_in
    end
  end

  get '/sign_in_confirmation' do
    @title = 'Thank you for signing in'
    @user = User.find(session[:user_id])
    erb :sign_in_confirmation
  end

  get '/sign_out' do
    @title = 'Sign out'
    @user = User.find(session[:user_id])
    session.clear
    erb :sign_out_confirmation
  end

  get '/new_peep' do
    @title = 'New peep'
    @user = User.find(session[:user_id])
    erb :new_peep
  end

  post '/new_peep' do
    Peep.create(peep: params['peep'])
    redirect '/'
  end

  run! if app_file == $0
end

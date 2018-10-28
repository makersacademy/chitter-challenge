require 'sinatra/base'
require 'sinatra/flash'
require './database_setup'
require './lib/user'

class ChitterApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get'/user_registration' do
    erb :user_registration
  end

  post '/register_user' do
    user = User.create(
      first_name: params['first_name'],
      last_name: params['last_name'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/'
  end

  get '/session/new' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(email: params['email'], password: params['password'])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/session/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

end

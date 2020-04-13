require 'sinatra/base'
require './lib/peeps.rb'
require './database_connection_setup.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @notice = session[:signed_out]
    @user = User.find(session[:user_id])

    @messages = Peeps.all
    erb :index
  end

  post '/' do 
    peep = params[:peep]
    Peeps.add(peep)
    redirect('/')
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password], 
      username: params[:username], name: params[:name])

    session[:user_id] = user.id
    redirect('/')
  end

  get '/signin' do
    @login_error = session[:login_error]
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      session[:login_error] = 0
      session[:signed_out] = nil
      redirect('/')
    else 
      session[:login_error] = 'Please check your email or password.'
      redirect('/signin')
    end

  end

  post '/sessions/destroy' do
    session.clear
    session[:signed_out] = 'you signed out.'
    redirect('/')
  end
end

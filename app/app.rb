ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './dm_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions

  get '/signup' do
    @alert = session[:alert]
    erb(:signup)
  end

  post '/signup' do
    used_email = User.first(email: params[:email])
    used_username = User.first(username: params[:username])
    
    if used_email
      session[:alert] = 'Email address is registered to another account'
      redirect('/signup')
    elsif used_username
      session[:alert] = 'Username is already in use'
      redirect('/signup')
    else
      User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
      session[:current_user] = User.first(username: params[:username])
      redirect('/')
    end
  end

  get '/login' do
    @alert = session[:alert]
    erb(:login)
  end

  post '/login' do
    valid_username = User.first(username: params[:username])

    if valid_username
      valid_password = valid_username.password == params[:password]
      if valid_password
        session[:current_user] = valid_username
        redirect('/')  
      else
        session[:alert] = 'Incorrect password'
        redirect('/login')
      end  
    else
      session[:alert] = 'User account does not exist'
      redirect('/login')
    end
  end

  delete '/sessions' do
    session[:current_user] = nil
    redirect('/')
  end

  get '/' do
    session[:alert] = nil
    @logged_in = !!session[:current_user]
    @name = session[:current_user].name if @logged_in
    erb(:index)
  end

  run! if app_file == $0
end
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './dm_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    User.create(username: params[:username], password: params[:password])
    session[:current_user] = params[:username]
    redirect('/')
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
        session[:alert] = nil
        session[:current_user] = params[:username]
        redirect('/')  
      else
        session[:alert] = 'Incorrect password!'
        redirect('/login')
      end  
    else
      session[:alert] = 'User account does not exist!'
      redirect('/login')
    end
  end

  delete '/sessions' do
    session[:current_user] = nil
    redirect('/')
  end

  get '/' do
    @username = session[:current_user]
    @logged_in = !!@username
    erb(:index)
  end

  run! if app_file == $0
end
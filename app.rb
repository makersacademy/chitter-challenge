# frozen_string_literal: true
require 'sinatra/flash'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './spec/database_connection_setup'
require_relative './spec/login_helper'

class Chitter < Sinatra::Base
  enable :method_override
  enable :sessions

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    if logged_in?
      redirect '/chitter'
    else
      erb :prompt
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:email] == "" || params[:confirm_password] == ""
      flash[:notice] = "Please fill in all fields"
      redirect to '/'
    elsif params[:password] != params[:confirm_password]
      flash[:notice] = "Passwords don't match!"
      redirect to '/'
    else
      user = User.create(username: params[:username], password: params[:password], 
email: params[:email])
      session[:user_id] = user.id
      session[:username] = user.username
      redirect '/'
    end
  end   

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(username: params[:username],password: params[:password])
      session[:user_id] = user.id
      session[:username] = user.username
      redirect "/chitter"
    else
      flash[:notice] = "Credentials incorrect!"
      redirect '/'
    end
  end

  get '/chitter' do
    if logged_in? 
      @peeps = Peep.all
      erb :index
    else
      erb :prompt
    end
  end

  post '/post_peep' do
    Peep.create(params[:content],session[:username])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME

end

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'rubygems'
require 'tilt/erb'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions
  set :sessions_secret, 'woobly-doobly'

  get '/' do
    erb(:index)
  end

  post '/users' do
    user = User.create(full_name:             params[:full_name],
                       username:              params[:username],
                       email:                 params[:email],
                       password:              params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      erb(:chits)
    else
      flash.now[:errors] = user.errors.full_messages
      erb(:index)
    end
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      erb(:chits)
    else
      flash.now[:details_error] =
      'Incorrect username or password. Check your details or please sign up.'
      erb(:index)
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.now[:notice] = 'Thank you and goodbye!'
    erb(:index)
  end

  post '/chits' do
    chit = Chit.create(chit_text: params[:chit_field])
    erb(:chits)
  end

  get '/chits' do
    @chits = Chit.all
    erb(:chits)
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == 'app/app.rb'
end

require 'sinatra/base'
require 'data_mapper'
require 'tilt/erb'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_chatter_#{env}")
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!

class ChitterChatter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    erb :homepage
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @username = params[:username]
    @real_name = params[:real_name]
    @email = params[:email]
    @password = params[:password]
    user = User.create(username: @username,
                       real_name: @real_name,
                       email: @email,
                       password: @password)
    session[:username] = @username
    erb :homepage
  end

  post '/sessions' do
    @username = params[:username]
    @password = params[:password]
    user = User.authenticate(@username, @password)
    if user
      session[:username] = @username
      erb :homepage
    else
      erb :homepage
    end
  end

  delete '/sessions' do
    session[:username] = nil
    erb :homepage
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:username]) if session[:username]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == ChitterChatter

end

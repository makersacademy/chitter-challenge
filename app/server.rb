require 'sinatra/base'
require 'data_mapper'
require 'bcrypt'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/lib/user'
require './app/lib/peep'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

    set :views, proc { File.join(root, '.', 'views') }

    enable :sessions
    set :session_secret, 'super secret'
  
  get '/' do
    erb :homepage
  end

  post '/' do
    @username = params[:username]
    erb :homepage
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:notice] = "Sorry, your passwords don't match"
      erb :"users/new"
    end
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

  get '/sessions/new' do
    erb :'sessions/new'
  end

  helpers do
    def current_user
      @current_user || User.get(session[:user_id]) if session[:user_id]
    end
  
  end

  run! if app_file == Chitter
end

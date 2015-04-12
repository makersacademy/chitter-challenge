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

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/sessions' do
    
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

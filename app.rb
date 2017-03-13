require 'sinatra/base'
require './datamapper_config'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.create(username: params[:username],
                name: params[:name],
                email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect '/thanks'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/thanks' do
    erb :thanks
  end

  get '/login' do
    erb :login
  end

  post '/' do
    redirect '/'
  end

end

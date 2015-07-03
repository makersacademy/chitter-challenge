require 'sinatra/base'
require './app/models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :sessions_secret, 'super secret'

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/sessions/new' do
    erb :'sessions/new'  
  end

  helpers do
    def current_user
      @user||=User.get session[:user_id]
    end
  end
  # LEARN HOW TO DO THIS. THIS GIVES ACCESS TO THE USER FOR WELCOME AFTER SIGN_UP
end

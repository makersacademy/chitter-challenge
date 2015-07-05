require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    erb :'posts/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(username: params[:username],
                       email: params[:email],
                       password: params[:password],)
    session[:user_id] = @user.id
    redirect '/posts'
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end
end
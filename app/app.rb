require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'


  get '/' do
    @comments = Comment.all
    erb(:home)
  end

  post '/comments' do
    Comment.create(comment: params[:comment])
    redirect('/')
  end

  get '/user/new' do
    erb(:'users/new')
  end
  
  post '/user' do
    user = User.create(name: params[:name], user_name: params[:user_name],
               email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run if app_file == $PROGRAM_NAME
end

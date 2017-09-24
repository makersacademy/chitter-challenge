ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/post'
require_relative 'data_mapper_setup'

class Blabber < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/posts' do
    @posts = Post.all
    erb(:'posts/index')
  end

  # get '/posts/new' do
  #   erb(:'posts/new')
  # end

  post '/posts' do
    Post.create(body: params[:body])
    redirect '/posts'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to '/posts'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end

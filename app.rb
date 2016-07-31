ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'bcrypt'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
register Sinatra::Flash
enable :sessions
set :session_secret, 'super secret'

  get '/' do
    'Hello chitter!'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
    session[:user_id] = @user.id
    redirect to '/posts'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'posts/new'
    end
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    Post.create(title: params[:title], post: params[:post])
    redirect '/posts'
  end

  helpers do
    def current_user
      @current_user || User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

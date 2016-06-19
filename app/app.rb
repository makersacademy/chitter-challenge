ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/post'
require_relative 'models/user'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  get '/' do
    redirect '/posts'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  post '/posts' do
    Post.create(peep: params[:peep], author: 'Jeff')
    redirect '/posts'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/posts')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      redirect '/users/new'
    end
  end

  helpers do
    def current_user
     @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end

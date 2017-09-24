ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/post'
require_relative 'data_mapper_setup'


class Blabber < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  get '/posts' do
    @posts = Post.all
    erb(:'posts/index')
  end

  post '/posts' do
    Post.create(body: params[:body])
    redirect '/posts'
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
        session[:user_id] = @user.id
        redirect to '/posts'
    else
      flash.now[:notice] = "Passwords do not match"
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/posts')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:'sessions/new')
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end

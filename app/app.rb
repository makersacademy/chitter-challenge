require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  enable :static
  set :sessions_secret, 'v secret'
  set :public_folder, Proc.new { File.join(root, '..', 'public') }

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save # save returns true if model has been saved to the db
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/posts')
      # redirect to('/post/new')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :index
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = 'Goodbye!'
    redirect to('/posts')
    # user = User.get(session[:user_id]).destroy
    # erb :index
  end

  get '/' do
    if current_user
      @post = Post.new
      redirect to('/posts')
    else
      redirect to('/users/new')
    end
  end

  get '/posts' do
    @posts = Post.all(:order => :created_at.desc)
    # @posts = Post.sort_posts
    erb :index
  end

  post '/posts' do
    @post = Post.create(message: params[:message], user_id: current_user.id)
    # post = Post.new
    # current_user.post.create(message: params[:message])
    erb :index
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end

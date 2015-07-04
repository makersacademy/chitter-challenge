require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions, :static
  set :sessions_secret, 'v secret'
  set :public_folder, Proc.new { File.join(root, '..', 'public') }

  get '/' do
    @posts = Post.all
    erb :index
  end

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
      redirect to('/posts/add')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end

ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class CHITTER < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'
  set :public_folder, Proc.new { File.join(root, 'static') }
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'/sessions/new'
  end

  get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end

  post '/posts' do
    time = Time.now
    post = Post.new(text: params[:text],
                    time: time.strftime("Posted on %d/%m/%Y at %I:%M%p"))
    post.save
    redirect '/posts'
  end

  get '/posts/new' do
    erb :'/posts/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'So long'
    redirect to '/posts'
  end

  get '/stylesheets/style.css' do
    scss :style
  end

  run! if app_file == $PROGRAM_NAME
end

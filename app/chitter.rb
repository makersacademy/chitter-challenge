ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class CHITTER < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  set :public_folder, Proc.new { File.join(root, 'static') }

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/posts'
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
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    # @user.save
    redirect '/posts'
  end

  get '/stylesheets/style.css' do
    scss :style
  end

  run! if app_file == $PROGRAM_NAME
end

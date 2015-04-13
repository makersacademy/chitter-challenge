require 'sinatra/base'
require 'data_mapper'
require_relative 'lib/hashtag'
require_relative 'lib/post'
require_relative 'lib/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require_relative 'lib/post'
require_relative 'lib/hashtag'
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'user sign up'

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end
end

  get '/' do
   @posts = Post.all
   erb :index
  end

  post '/posting' do
    username = params['username']
    message = params['message']
    hashtag = params['hashtag'].split(' ').map do |hashtag|
    Hashtag.first_or_create(text: hashtag)
    end
    
    Post.create(username: username, message: message, hashtag: hashtag)
    redirect to ('/')
  end

get '/hashtags/:text' do
  hashtag = Hashtag.first(:text => params[:text])
  @posts = hashtag ? hashtag.posts : []
  erb :index
end

  get '/users/new' do
    @user = User.new
    erb :new
  end

  post '/users' do
  @user = User.create(email: params[:email],
              password: params[:password])
  session[:user_id] = user.id
  redirect to('/')
  end

  get '/sessions/new' do
  erb :'sessions/new'
  end


  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

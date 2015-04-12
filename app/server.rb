require 'sinatra/base'
require './app/data_mapper_setup'
require 'byebug'
require 'rack-flash'
require 'tilt/erb'
require_relative 'models/convo'
require_relative 'models/user'
require_relative 'models/tag'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::Flash

  get '/' do
    @convos = Convo.all
    erb :home
  end

  post '/message' do
    title = params['title']
    message = params['message']
    tags = params['tags'].split(' ').map do |tag|
      Tag.first_or_create(text: tag)
    end
    Convo.create(message: message, tags: tags)
    redirect to '/'
  end

  get '/tags/:text' do
    tag = Tag.first(text: params[:text])
    @convos = tag ? tag.convo : []
    erb :home
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(user_name: params[:user_name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/welcome_message')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user_name, password = params[:user_name], params[:password]
    user = User.authenticate(user_name, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  get '/welcome_message' do
    erb :welcome_message
  end

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end

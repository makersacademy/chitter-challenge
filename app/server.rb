require 'sinatra/base'
require './app/data_mapper_setup'

require 'byebug'
require 'tilt/erb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

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
    erb :'user/new'
  end

  post '/user' do
    user = User.create(user_name: params[:user_name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/welcome_message')
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

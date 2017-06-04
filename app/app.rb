ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_config'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/messages' do
    @messages = Message.all(:order => [:created_at.desc])
    erb :messages
  end

  get '/messages/new' do
    erb :new_message
  end

  post '/messages/new' do
    Message.create(user_id: current_user.id, message: params[:message])
    redirect '/messages'
  end

  get '/users/new' do
    @user = User.new
    erb :new_user
  end

  post '/users/new' do
    @user = User.create(user_name: params[:user_name], user_email: params[:user_email])

    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:notice] = "Please provide a valid email address"
      erb :new_user
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end

require 'sinatra/base'
require 'sinatra/flash'

ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'
# main sinatra application
class Tweeter < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'
  use Rack::MethodOverride
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def all_twits
      @all_twits ||= Twit.all(order: [:time_stamp.asc])
    end
  end

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :'user/new'
  end

  get '/twit/new' do
    erb :'twit/new'
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/twit' do
    Twit.create(content: params[:content],
                user: current_user,
                time_stamp: Time.new)
    redirect '/'
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      flash.now[:errors] = ['incorrect username or password']
      erb :'/session/new'
    else
      session[:user_id] = user.id
      redirect '/'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    redirect to '/'
  end

  post '/user' do
    user = User.create(params)
    if user.valid?
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'/user/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

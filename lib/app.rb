require 'sinatra/base'
require 'sinatra/flash'

ENV["RACK_ENV"] ||= "development"
require_relative 'data_mapper_setup'

class Tweeter < Sinatra::Base
  enable :sessions
  set :session_secret, "secret"

  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
    def all_twits
      @all_twits ||= Twit.all(order: [ :time_stamp.desc ])
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

  post '/twit' do
    Twit.create(content: params[:content],user: current_user, time_stamp: Time.new)
    redirect '/'
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

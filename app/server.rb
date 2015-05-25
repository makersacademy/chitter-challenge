require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, "postgres://localhost/chatter_#{env}")

require_relative 'models/message'
require_relative 'models/user'

DataMapper.finalize

DataMapper.auto_upgrade!



class Chatter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/peeps' do
    peep = params['peep']
    username = params['username']
    Message.create(peep: peep, username: username)
    redirect to('/')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/')
  end

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

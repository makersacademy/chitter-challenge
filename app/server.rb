require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require_relative 'models/message'
require_relative 'models/user'
# require_relative 'helpers/application'
require_relative 'data_mapper_setup'


class Chatter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/peeps' do
    peep = params['peep']
    user_id = session[:user_id]
    time = Time.now
    Message.create(peep: peep, time: time, user_id: user_id)
    redirect to('/')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                     username: params[:username],
                     name: params[:name],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
    end
  end

    delete '/sessions' do
      flash[:notice] = "Good-bye!"
      session[:user_id] = nil
      redirect to('/')
  end

end

ENV["RACK_ENV"] ||= "development"


require 'sinatra/base'
require './models/user'
require './models/peep'
require 'sinatra/flash'
require './database_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride


  enable :sessions
  set :session_secret, 'super duper secret'


  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(body: params[:peep], time: Time.now)
      peep.user = current_user
      peep.save
      redirect '/peeps'
    else
      flash.keep[:notifications] = ['You need to log in to peep']
      redirect '/peeps'
    end
  end

  get '/accounts/new' do
    session[:user_id] = nil
    erb :'accounts/new'
  end

  post '/accounts' do
    user = User.create(email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation] )
    if user.save
      session[:user_id] = user.id
      flash.next[:notifications] = ['You have logged in']
      redirect '/peeps'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'accounts/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      flash.next[:notifications] = ['You have logged in']
      redirect '/peeps'
    else
      flash.now[:errors] = ['Username or Password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notifications] = ['You have logged out']
    redirect '/peeps'
  end


  helpers do
    def current_user
        @current_user ||= User.get(session[:user_id])
    end

    def color_picker
      ['aquamarine', 'coral', 'gold', 'crimson', 'dodgerblue'].sample
    end

  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

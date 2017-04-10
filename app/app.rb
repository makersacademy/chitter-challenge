ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'top secret data'

  get '/' do
    erb :welcome
  end

  get '/home' do # The path / url.
    @peeps = Peep.all # Set instance variable to Peep all.
    erb :'peeps/index' # Reference the file.
  end

  post '/peeps' do
    peep = Peep.create(name: current_user.name, user_name: current_user.user_name, peep: params[:peep], time: peep_time)
    redirect '/home'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/create_user' do
    @user = User.create(name: params[:name], email: params[:email], user_name: params[:user_name], password: params[:password], confirm_password: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/home'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def peep_time
      (Time.now).strftime("%H:%M")
    end
  end
end

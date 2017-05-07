ENV["RACK_ENV"] ||= "development"

require './models/user'
require 'sinatra/base'
require './data_mapper_setup.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/users/new' do
    @user = User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/welcome')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/signup'
    end
  end

  get '/welcome' do
    erb :welcome
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to ('/welcome')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end

  get '/peeps/all' do
    @peep = session[:peep]
    erb :'/peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/submitted' do
    session[:peep] = params[:peep]
    redirect to('/peeps/all')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end

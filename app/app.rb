ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require './app/models/user.rb'
require './app/datamapper_setup.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  post '/' do
    @user = User.new(name: params[:name],
    username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/session' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ["The email or password is incorrect"]
      erb :index
    end
  end

  get '/peeps' do
    erb :peeps
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  delete '/session' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to('/')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

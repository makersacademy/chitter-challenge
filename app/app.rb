require 'sinatra/base'
require './app/data_mapper_setup.rb'
require 'sinatra/flash' #sinatra_flash 1/5 + in layout
require 'tilt/erb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'

  register Sinatra::Flash  #sinatra_flash 2/5
  use Rack::MethodOverride #sinatra_flash 3/5

  get '/' do
    erb :index
  end

  get '/user/login' do
    erb :'user/login'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      flash[:notice] = "Successfully log int." #sinatra_flash 4/5
      session[:user_id] = user.id
      redirect to('/welcome')
    else
      flash.now[:errors] = 'The email or password is incorrect' #sinatra_flash 5/5
      erb :'user/login'
    end
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    user = User.new(name: params[:name],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if user.save
      flash[:notice] = "Successfully added new applicant."  #sinatra_flash 6/
      session[:user_id] = user.id
    else
      flash[:notice] = "Please enter the same password"
      redirect('/user/new')
    end
    redirect('/welcome')
  end

  get '/welcome' do
    erb :welcome
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

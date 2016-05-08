
ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class ChitterChatter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello ChitterChatter!'
    redirect to('/users/new')
  end

  get '/users/new' do
    user = User.new
    erb :'users/new'
  end
  post '/users' do
    user = User.create(email: params[:email], password: params[:password],
     password_confirmation: params[:password_confirmation])
     
    session[:user_id] = user.id
    redirect to('/chits')
  end
  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end
  get '/sessions/new' do
    erb :'sessions/new'
  end
  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/chits')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end
  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye, thanks for sharing your view on Chitter'
    redirect to '/chits'


  end
  get '/chits' do
    erb :'chits/index'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

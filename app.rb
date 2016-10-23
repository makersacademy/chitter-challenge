ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'app/data_mapper_setup'


class Chitter < Sinatra::Base

  set :root, 'app'

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  get '/peeps' do
    erb :peeps
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end

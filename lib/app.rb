ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class App < Sinatra::Base

register Sinatra::Flash
enable :sessions
set :session_secret, 'super secret'

helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/landing'
  end

  get '/landing' do
    erb:'landing'
  end

  get '/sign_up' do
    erb:'sign_up'
  end

  post '/sign_up' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if user.save
    redirect '/sessions/new'
    else
    redirect '/sign_up'
    end
  end

  get '/sessions/new' do
    erb:'log_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect to('/home')
      else
        flash.now[:errors] = ['The email or password is incorrect']
        erb 'log_in'
      end
  end

  get '/home' do
    erb:'home'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

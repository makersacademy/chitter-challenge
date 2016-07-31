ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
      end
  end

  get '/' do
    'Hello Chitter!'
  end

  get '/users/register' do
    erb :'users/new'
  end

  post '/users' do
    user =User.create(email: params[:emai],
                password: params[:password],
                name: params[:name],
                user_name: params[:user_name] )
    session[:user_id = user.id]
    redirect to('/home')
  end

  get '/home' do
   erb :'home'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

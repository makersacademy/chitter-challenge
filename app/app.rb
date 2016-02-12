ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super-secret'

  get '/' do
    erb(:index)
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/sign-up' do
    user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email]
    )
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/home' do
    erb :home
  end

  helpers do
    def current_user
      @current_user = User.get(session[:user_id]) 
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

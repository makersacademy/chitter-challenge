require 'sinatra/base'
require './models/user'

class Chitter < Sinatra::Base
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

  get '/sign_up' do
    erb :sign_up
  end

  get '/new_user' do
    #for some reason, this won't work with post
    user = User.create(name: params[:name], email: params[:email], handle: params[:handle], password: params[:password])
    session[:user_name] = params[:name]
    session[:user_id] = user.id 
    redirect ('/confirm')
  end

  get '/confirm' do
    erb :confirm
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

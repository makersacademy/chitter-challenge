ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/sign-up' do
    @users = User.all
    erb :sign_up
  end

  post '/new-user' do
    user = User.create(name: params[:name], user_name: params[:user_name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/my-chitter')
  end

  get '/my-chitter' do
    erb :my_chitter
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

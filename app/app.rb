require 'sinatra/base'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    redirect '/user/sign_up'
  end

  get '/user/sign_up' do
    erb :'user/sign_up'
  end

  post '/user/sign_up' do
    user = User.new(user_name: params[:user_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    user.save
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/home' do
    erb :home
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

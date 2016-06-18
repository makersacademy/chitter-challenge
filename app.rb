ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './model/user'
class ChitterChatter < Sinatra::Base
  enable :sessions
  get '/' do
    erb :'users/new'
  end

  post '/add' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('sign_in')
  end

  get '/sign_in' do
    erb :'users/sign_in'
  end

  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

  run! if app_file == $0
end

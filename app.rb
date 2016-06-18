ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require './model/user'
class ChitterChatter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :'users/new'
  end

  post '/add' do
    user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if(user.save)
      session[:user_id] = user.id
      redirect('sign_in')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  get '/sign_in' do
    erb :'users/sign_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/message_new')
    else
      flash.now[:notice] = 'The email or password is incorrect'
      erb :'users/sign_in'
    end
  end

  get '/message_new' do
    erb :'message/message_new'
  end


helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

  run! if app_file == $0
end

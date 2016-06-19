ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative "data_mapper_setup"

require './model/user'
require './model/message'
class ChitterChatter < Sinatra::Base
  use Rack::MethodOverride
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
      p "Calling msg new"
      redirect('/message_new')
    else
      flash.now[:notice] = 'The email or password is incorrect'
      erb :'users/sign_in'
    end
  end

  get '/message_new' do
    @current_user_mail =
    erb :'message/message_new'
  end


  post '/message_create' do
    p current_user
    if @current_user
      @message = Message.create(message: params[:message],user: @current_user, timestamp: Time.now)
    end
    redirect('/show_message')
  end

  get '/show_message' do
    @message = Message.all
    erb :'message/show_message'
  end

delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = 'GoodBye!! Hope to see you back again'
  redirect to '/bye'
end

get '/bye' do
  @message = Message.all
  erb :'message/bye'
end


helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

  run! if app_file == $0
end

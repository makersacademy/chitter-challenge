ENV["RACK_ENV"] ||= "development"
require 'sinatra'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'
register Sinatra::Flash

  get '/peeps' do
    erb :'peeps/index'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/peeps')
    elsif params[:password] != params[:password_confirmation]
      flash.now[:error] = "Your passwords did not match"
      erb :'/user/new'
    elsif !User.first(:email => (@user.email)).nil?
      flash.now[:error] = "Email already registered"
      erb :'/user/new'
    end
  end

  get '/user/signin' do
    erb :'user/signin'
  end

  post '/user/signin' do
    user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect to('/peeps')
      else
        flash.now[:errors] = ['The email or password is incorrect']
        erb :'user/signin'
      end
  end

  helpers do
   def current_user
    @current_user ||= User.get(session[:user_id])
   end
 end

end

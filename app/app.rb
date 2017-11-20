ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class App < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @post = Post.all
    erb(:home)
  end

  get '/newpost' do
    erb(:newpost)
  end

  post '/home' do
    newpost = Post.new(title: params[:title],post: params[:post],
              name: params[:name])
    newpost.save
  redirect('/home')
 end

  get '/newuser' do
    @user = User.new
    erb(:newuser)
  end

  post '/users' do
   @user = User.create(email: params[:email],username: params[:username],
              password: params[:password], password_confirmation:
              params[:password_confirmation])
   if @user.save
     session[:user_id] = @user.id
     redirect to('/home')
   else
     flash.now[:notice] = "Password and confirmation password do not match"
     erb(:newuser)
   end
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/home')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb(:login)
  end
end

delete '/login' do
  session[:user_id] = nil
  flash.keep[:notice] = 'We will miss you!'
  redirect to '/home'
end

  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

end

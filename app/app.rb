ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class App < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

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
    newpost = Post.new(title: params[:title],post: params[:post], name: params[:name])
    newpost.save
  redirect('/home')
 end

  get '/newuser'do
    erb(:newuser)
 end

  post '/user' do
    user = User.create(email: params[:email],username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

end

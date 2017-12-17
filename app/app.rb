require 'sinatra/base'
require_relative './data_mapper_setup'
require_relative './user_helper'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  include UserHelper
  register Sinatra::Flash
  enable :sessions
  ENV['RACK_ENV'] = 'development'

  get '/' do
    'Welcome'
  end

  get '/posts' do
    @posts = Post.all.reverse
    get_current_user
    erb(:posts)
  end

  get '/posts/new' do
    erb(:new_post)
  end

  post '/posts' do
    if get_current_user
      Post.create(message: params[:message], user_id: session[:user_id])
      redirect '/posts'
    end
    flash.next[:errors] = "Must be logged in to post"
    redirect '/posts/new'
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    user = User.first({username: params[:username]})
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/posts'
    end
    flash[:errors] = ['Authentication failed']
    redirect '/login'
  end

  post '/logout' do
    session[:user_id] = nil
    @current_user = nil
    redirect '/posts'
  end

  get '/users/new' do
    erb(:register)
  end

  post '/users' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:confirm])
   if user.save
     session[:user_id] = user.id
   else
     flash.next[:errors] = user.errors.full_messages
     redirect '/users/new'
   end
   redirect '/posts'
  end
end

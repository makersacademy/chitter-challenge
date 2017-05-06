ENV["RACK_ENV"] = "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'server'

class Chitter < Sinatra::Base

  get '/' do
    erb :'index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.new(name: params[:name], username: params[:username],
    email: params[:email], password: params[:password],
    password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/posts')
    else
      flash.now[:notice] = "Username or password incorrect"
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = "Goodbye!"
    redirect to '/'
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    post = Post.first_or_create(message: params[:message], user: current_user, created_at: Time.now)
    current_user.posts << post
    current_user.save
    redirect to ('/posts')
  end

end

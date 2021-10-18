require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/user'
require './lib/message'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    @user = User.find(id: session[:user_id]) if session[:user_id]
    erb(:index)
  end

  post '/log_out' do 
    session[:user_id] = nil
    redirect "/"
  end

  get '/log_in' do 
    erb(:log_in)
  end

  post '/log_in' do
    user = User.log_in(username: params[:username], password: params[:password])
    unless user
      flash[:notice] = "Password did not match, please try again" 
      redirect(:'log_in')
    else
      session[:user_id] = user.id
      redirect "/"
    end
  end

  get '/user' do 
    erb(:'user/index')
  end

  post '/user' do
    user = User.create(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    unless user
      flash[:notice] = "Password did not match or username is taken, please try again" 
      redirect(:'user')
    else
      session[:user_id] = user.id
      redirect "/"
    end
  end

  get '/posts' do 
    @posts = Message.all
    erb(:posts)
  end

  get '/posts/' do 
    @user_id = session[:user_id]
    @posts = Message.where(user_id: session[:user_id])
    erb(:'posts/index')
  end


  get '/user/:id/posts/new' do
    @user_id = params[:id]
    erb :'posts/new'
  end

  post '/user/:id/posts' do
    Message.create(text: params[:text], user_id: params[:id])
    redirect '/posts/'
  end

  enable :method_override

  delete '/user/:id/posts/:post_id' do
    Message.delete(id: params[:post_id])
    redirect '/posts/'
  end

  get '/user/:id/posts/:post_id/edit' do
    @user_id = session[:user_id]
    @post = Message.find(id: params[:post_id])
    erb :"posts/edit"
  end

  patch '/user/:id/posts/:post_id' do
    Message.update(id: params[:post_id], text: params[:text])
    redirect '/posts/'
  end


  run! if app_file == $0
end
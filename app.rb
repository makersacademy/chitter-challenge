require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require './lib/user'
require './lib/post'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :'index'
  end

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/sign_up' do
    erb :'/users/sign_up'
  end

  get '/users/log_in' do
    erb :'/users/log_in'
  end

  post '/users/log_in' do
    email = params[:email]
    password = params[:password]
    @user = User.login(email: email, password: password)
    if @user
      session[:user_id] = @user.id
      redirect('/posts')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/users/log_in')
    end
  end

  post '/users/log_out' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  get '/users/:id/update' do
    erb :'/users/update'
  end

  patch '/users/:id/update' do
    id = params['id']
    user_name = params[:user_name]
    email = params[:email]
    @user = User.update(id: id, user_name: user_name, email: email)
    redirect '/posts'
  end

  post '/users' do
    user_name = params[:user_name]
    password = params[:password]
    email = params[:email]
    @user = User.create(user_name: user_name, password: password, email: email)
    session[:user_id] = @user.id
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    @user = User.find(session[:user_id])
    erb :'/posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts/:id/delete' do
    id = params['id']
    Post.delete(id)
    redirect '/posts'
  end

  post '/posts' do
    user_id = session[:user_id]
    message = params[:message]
    Post.create(user_id, message)
    redirect '/posts'
  end

  run! if app_file == $0
end

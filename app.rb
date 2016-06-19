require 'sinatra/base'
require './model/user'
require './model/post'
require 'Bcrypt'
require 'sinatra/flash'

ENV['RACK_ENV'] ||= 'development'

class App < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = session[:user_session]
    p '==============b'
    p Post.all
    @posts = Post.all
    @greeting = flash[:goodbye]
    erb :'index'
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/create_user' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_session] = User.first(name: params[:name])
    redirect '/'
  end

  get '/sign_in' do
    erb :'sign_in'
  end

  post '/sign_in_check' do
    if User.validate(params[:username], params[:password])
      session[:user_session] = User.first(username: params[:username])
      redirect '/'
    else
      redirect '/sign_in'
    end
  end

  get '/sign_out' do
    erb :'sign_out'
  end

  post '/sign_out' do
    if session[:user_session]
      flash[:goodbye] = "Goodbye #{session[:user_session].name}"
      session[:user_session] = nil
      redirect '/'
    else
      redirect '/signout'
    end
  end

  get '/post' do
    erb :'post'
  end

  post '/create_post' do
    if session[:user_session]
      p '================a1'
      p 'post.all'
      p Post.all
      p '================a2'
      Post.create(message: params[:comment], user_id: session[:user_session].id)
      p 'post.all'
      p Post.all
      redirect '/'
    else
      redirect '/post'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

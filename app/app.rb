ENV["RACK_ENV"] ||= "development"
require 'sinatra'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    redirect('/posts')
  end

  get '/posts' do
    @posts = Post.all(:order => [:created_at.desc])
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    peep = Post.create(content: params[:content], user_id: current_user.id)
    peep.save
    redirect('/posts')
  end

  get '/posts/:username' do
    user = User.first(:username => params[:username])
    @posts = Post.all(:user_id => user.id)
    erb :'posts/index'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      image_url: params[:image_url],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
      puts @user.image_url
    if @user.save
      session[:id] = @user.id
      redirect('/posts')
    elsif params[:password] != params[:password_confirmation]
      flash.now[:error] = "Your passwords did not match"
      erb :'/user/new'
    elsif User.first(:email => (@user.email))
      flash.now[:error] = "Email already registered"
      erb :'/user/new'
    else
      flash.now[:error] = "An error occurred #{@user.errors.inspect}"
      erb :'/user/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:id] = user.id
      redirect to('/posts')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect('/posts')
  end

  helpers do
    def current_user
      User.first(:id => session[:id])
    end
  end

end

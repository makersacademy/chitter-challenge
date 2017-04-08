ENV["RACK_ENV"] ||= "development"
require 'sinatra'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    redirect('/posts')
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    peep = Post.create(content: params[:content])
    peep.save
    redirect('/posts')
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
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
      flash.now[:error] = "An error occurred"
      erb :'/user/new'
    end
  end

  helpers do
    def current_user
      User.first(:id => session[:id])
    end
  end

end

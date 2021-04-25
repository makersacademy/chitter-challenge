require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'sinatra/activerecord'
require 'sinatra/flash'
require_relative './lib/post.rb'
require_relative './lib/user.rb'

set :database_file, 'config/database.yml'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @recent_posts = Post.last(10).reverse
    @user = session[:user]
    erb :index
  end

  get '/new_post' do
    if session[:user] == nil 
      flash[:error] = 'You must be signed in to post.'
      redirect '/'
    else
      erb :new_post
    end
  end

  post '/new_post' do
    Post.create(username: session[:user].username,
                name: session[:user].name, 
                message: params[:new_post], 
                time_posted: DateTime.now.strftime("%H:%M %b %e"))
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    if User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username]).valid?
      flash[:alert] = 'Account successfully created'
      redirect '/'
    else
      flash[:error] = 'The email or username is already in use please try another'
      redirect '/sign_up'
    end
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    user = User.find_by(username: params[:username])
    if user && user.password == params[:password]
      session[:user] = User.find_by(username: params[:username])
      redirect '/'
    else
      flash[:error] = 'Your username or password is invalid. Please try again.'
      redirect '/sign_in'
    end
  end

  post '/sign_out' do
    session[:user] = nil
    flash[:alert] = 'You have successfully signed out'
    redirect '/'
  end
end

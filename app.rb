require 'byebug'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
# require_relative './database_connection_setup.rb'
require 'pg'
require 'bcrypt'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
    set :public_folder, Proc.new { File.join(root, 'static') }
  end

  enable :sessions, :methods_override

  attr_reader :user, :peeps, :user_email

  get '/' do
     erb :"/index"
  end

  get '/users/new' do
    erb :"users/new"
  end 

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect :'/peeps'
  end 

  get '/peeps' do
    @user = User.find(session[:user_id])
    @user_email = @user.email
    @peeps = Peep.all
    erb :"peeps/index"
  end

  post '/peeps/:id' do
    peep = Peep.create(content: params[:peep], user_id: params[:id])
    redirect :'/peeps'
  end

  get '/sessions/new' do 
    erb :'/login'
  end

  post '/sessions' do
    @user = User.authenticate(username: params[:username], password: params[:password])

    if @user
      session[:user_id] = @user.id
      session[:email] = @user.email
      redirect '/peeps'
    else
      flash[:notice] = "Incorrect username or password. Please try again."
      redirect :'/login'
    end
end

post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/index')
end

helpers do
     
  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in 
    if !logged_in? 
      redirect to '/login' 
    end 
  end
  
end

  run! if app_file == $0
end
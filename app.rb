require "sinatra/base"
require "sinatra/flash"
require 'sinatra/activerecord'
require './db_connection_setup'
require "./lib/chitter"
require './lib/user'

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get "/" do 
    "Home"
  end

  get "/chitter" do 
    @user = session[:user]
    @posts = params[:Display] == "old" ? Chitter.all : Chitter.reverse_all
    erb :create
  end

  post "/chitter/create" do
    Chitter.create(params[:text])
    redirect "/chitter" 
  end

  get "/user/sign_up" do 
    erb :sign_up
  end

  post "/user/sign_up" do 
    User.create(params[:name], params[:email], params[:password])
    erb :user_sign_up_status
  end

  get "/user/login" do
    erb :login
  end

  post "/user/login" do 
    case User.log_in(params[:email], params[:password]) 
      when "Email Error"
        flash[:notice] = "User doesn't exist"
      when "Incorrect password"
        flash[:notice] = "Incorrect password"
      else
        session[:user] = User.log_in(params[:email], params[:password])
        redirect "/chitter"
      end
  end
  
end
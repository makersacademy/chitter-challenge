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
    @user = session[:user]
    @posts = params[:Display] == "old" ? Chitter.all : Chitter.reverse_all
    erb :index
  end

  post "/chitter/create" do
    Chitter.create(params[:text])
    redirect "/"
  end

  get "/user/sign_up" do 
    erb :sign_up
  end

  post "/user/sign_up" do 
    begin
      session[:user] = User.create(params[:name], params[:email], params[:password])
      session[:user].name #checks for error

      erb :user_sign_up_status
    rescue
      flash[:notice] = "This email is already registered"
      redirect "/user/sign_up"
    end
  end

  get "/user/login" do
    erb :login
  end

  post "/user/login" do 
    case User.log_in(params[:email], params[:password]) 
      when "Email Error"
        flash[:notice] = "User doesn't exist"
        redirect "/user/login"
      when "Incorrect password"
        flash[:notice] = "Incorrect password"
        redirect "/user/login"
      else
        session[:user] = User.log_in(params[:email], params[:password])
        redirect "/"
      end
  end

  get "/user/destroy" do 
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect "/"
  end

  
end
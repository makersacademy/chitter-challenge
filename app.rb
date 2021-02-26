require 'sinatra'
require './lib/posting.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get "/" do
    redirect "/home"
  end

  # get "/login" do
  #   erb :login
  # end
  #
  # post "/loginsuccess" do
  #   session[:username] = params[:username]
  #   session[:user_email] = params[:user_email]
  #   session[:user_password] = params[:user_password]
  #   redirect '/home'
  # end

  get "/home" do
    @chitters = Posts.all
    erb :home
  end

  post "/post_chitter" do
    username = params[:username]
    post = params[:post]
    redirect 'home'
  end

  run! if app_file == $0
end

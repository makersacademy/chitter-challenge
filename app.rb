require 'sinatra'
require './lib/posting.rb'
require './lib/account.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get "/" do
    redirect "/login"
  end

  get "/login" do
    erb :login
  end

  post "/createaccountsuccess" do
    Account.create(username: params[:username], user_email: params[:user_email], password: params[:password])
    redirect '/home'
  end

  get "/home" do
     @chitters = Posts.all
    erb :home
  end

  post "/post_chitter" do
    Posts.create(username: params[:username], post: params[:post])
    redirect 'home'
  end

  run! if app_file == $0
end

require 'sinatra/base'
require 'pg'
require './lib/tweet'
require './lib/user'
require_relative './database_connection_setup'
class ChitterApp < Sinatra::Base
  enable :sessions

  get "/" do

    @tweets = Tweet.display_tweets
    erb(:index)
  end

  post "/register" do
    @user = User.create
    result = @user.register(username: params[:username], email: params[:email], first_name: params[:fname], last_name: params[:lname], password: params[:pwd])
    if result == true
      session[:username] = params[:username]
      erb(:welcome)
    else 
      erb(:error)
    end
     
  end 

  post "/login" do
    @user = User.create
    sign_in_result = @user.sign_in(username: params[:username], password: params[:pwd])
    if sign_in_result == true 
      session[:username] = params[:username]
      erb(:welcome)
    else 
      erb(:error)
    end 

  end

  post "/new" do 
    is_inserted = Tweet.add_tweet(username: session[:username], message: params[:message])
    if is_inserted == true
      @tweets = Tweet.display_tweets
      erb(:tweets_list)
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  run! if app_file == $0
end

require 'sinatra/base'
require './lib/cheet'
require './lib/cheetah'
require 'pry'
require_relative './lib/boot_up_connection'

class ChitterFeed < Sinatra::Base
  enable :sessions
  get "/" do
    !!session[:user]? @welcome = "rawr #{session[:user].username}" : @welcome = "rawr cheetah"
    @feed = Cheet.all
    erb(:feed)
  end

  post "/cheet" do
    if !!session[:user]
      Cheet.create(params[:text_box], session[:user].username)
    else
      Cheet.create(params[:text_box])
    end
    redirect "/"
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    Cheetah.create(params[:username_box], params[:password_box])
    session[:user] = Cheetah.request(params[:username_box], params[:password_box])
    redirect '/'
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    session[:user] = Cheetah.request(params[:username_box], params[:password_box])
    redirect '/'
  end
end

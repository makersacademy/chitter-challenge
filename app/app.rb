require 'sinatra/base'
require './lib/chitter'

class Chitter_Main < Sinatra::Base
  enable :sessions

  get '/' do
    'Howdy'
    erb :index
  end


  post '/create_user' do
    # @email_1 = params[:email]
    # @password_1 = params[:password]
    # @name_1 = params[:name]
    # @user_1 = params[:username]
    session[:email_1] = params[:email]
    session[:password_1] = params[:password]
    session[:name_1] = params[:name]
    session[:user_1] = params[:username]
    # erb :logged_in
    redirect '/logged_in'
  end

  get '/logged_in' do
    @email_1 = session[:email_1]
    @password_1 = session[:password_1]
    @name_1 = session[:name_1]
    @user_1 = session[:user_1]
    erb :logged_in
  end


  get '/postboard' do
    @chitter = Chitter.all
    @name_1 = session[:name_1]
    @user_1 = session[:user_1]
    erb :postboard
  end

  post '/chitter_post' do
    # Chitter.create(post: params[:post], time: params[:time])
    Chitter.create(post: params[:post])
    redirect '/postboard'
  end

  run! if app_file == $0
end

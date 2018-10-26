require 'sinatra/base'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    if session[:unique_user] == nil
      @unique_user = true
    else
      @unique_user = session[:unique_user]
    end
    erb :index
  end

  post '/sign_up' do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]
    if User.check_if_unique(username, email)
      session[:unique_user] = true
      session[:user] = User.create(name: name, username: username, email: email, password: password)
      session[:new_user] = true
      redirect "/u/#{username}"
    else
      session[:unique_user] = false
      redirect "/"
    end
  end

  get '/peeps' do
    user = session[:user]
    @username = user.username
    @last_peep = session[:last_peep]
    erb :peeps
  end

  post '/peeps/new' do
    session[:last_peep] = params[:new_peep]
    redirect "/peeps"
  end

  get '/log-in' do
    if session[:correct_password] == nil
      @correct_password = true
    else
      @correct_password = session[:correct_password]
    end
    erb :log_in
  end

  post '/log-in' do
    username = params[:username]
    password = params[:password]
    if User.check_password(username, password)
      session[:correct_password] = true
      session[:user] = User.find_by_username(username)
      session[:new_user] = false
      redirect "/u/#{username}"
    else
      session[:correct_password] = false
      redirect "/log-in"
    end
  end

  get '/log-out' do
    redirect "/"
  end

  get '/u/:username' do
    user = session[:user]
    @name = user.name
    @username = user.username
    @new_user = session[:new_user]
    erb :profile
  end

end

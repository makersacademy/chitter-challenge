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
      User.create(name: name, username: username, email: email, password: password)
      redirect "/u/#{username}"
    else
      session[:unique_user] = false
      redirect "/"
    end
  end

  get '/peeps' do
    @username = session[:username]
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

  post 'log-in' do
    username = params[:username]
    password = params[:password]
    if User.check_password(username, password)
      session[:correct_password] = true
      redirect "/u/#{username}"
    else
      session[:correct_password] = false
      redirect "/log-in"
    end
  end

  get '/u/:username' do
    @name = User.all.last.name
    @username = User.all.last.username
    session[:username] = @username
    erb :profile
  end

end

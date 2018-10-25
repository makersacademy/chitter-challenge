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
      redirect "/#{username}"
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


  get '/:username' do
    @name = User.all.last.name
    @username = User.all.last.username
    session[:username] = @username
    erb :profile
  end

end

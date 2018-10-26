require 'sinatra/base'
require './lib/cheet'
require './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @current_user = session[:current_user]
    @cheets = Cheet.all.reverse
    erb :index
  end

  post '/login' do
    user = User.login(params[:Username], params[:Password])
    if user == 'fail'
      flash[:notice] = "Invalid credentials"
      redirect('/')
    else
      session[:current_user] = user
      redirect "/profile"
    end
  end

  get '/profile' do
    @cheets = Cheet.all.reverse
    @current_user = session[:current_user]
    erb :profile
  end

  get '/logout' do
    session.clear
    params[:name]
    redirect '/'
  end

  get '/register' do
    erb :register
  end

  post '/registered' do
    current_user = User.create(params[:Email], params[:Name], params[:Username], params[:Password], params[:Confirm_Password])
    if current_user == 'not unique'
      flash[:message] = "Username or email already taken."
      redirect '/register'
    elsif current_user == 'no match'
      flash[:message] = "Passwords don't match."
      redirect '/register'
    else
      session[:current_user] = current_user
      redirect '/'
    end
  end

  post '/new-cheet' do
    Cheet.create(params[:cheet])
    redirect '/'
  end

end

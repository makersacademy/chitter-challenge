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
      flash[:notice] = "Invalid username or password"
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

    session[:current_user] = current_user
    redirect '/'
  end

  post '/new-cheet' do
    Cheet.create(params[:cheet])
    redirect '/'
  end

end

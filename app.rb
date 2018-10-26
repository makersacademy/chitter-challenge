require 'sinatra/base'
require './lib/cheet'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @current_user = session[:current_user]
    @cheets = Cheet.all.reverse
    erb :index
  end

  post '/login' do
    user = User.login(params[:Username], params[:Password])
    session[:current_user] = user
    redirect('/')
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
    email = params[:Email]
    name = params[:Name]
    user = params[:Username]
    pass = params[:Password]
    confirm = params[:Confirm_Password]
    current_user = User.new(email, name, user, pass, confirm)
    User.check(current_user)
    session[:current_user] = current_user
    redirect '/'
  end

  post '/new-cheet' do
    Cheet.create(params[:cheet])
    redirect '/'
  end

end

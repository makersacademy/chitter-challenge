require 'sinatra/base'
require 'sinatra/flash'
require './lib/chitter'
require './lib/user'
require 'pry'
require './database_connection_setup'

class ChitterApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    @user = User.find(session[:user_id]) if session[:user_id] != nil
    @peeps = Chitter.all_peeps
    erb(:index)
  end

  get '/chitter/new' do
    @user = User.find(session[:user_id]) if session[:user_id] != nil
    erb(:new)
  end

  post '/chitter' do
    @user = Chitter.create(session[:user_id], params[:content])
    redirect('/chitter')
  end

  get '/chitter/users/new' do
    erb(:signup)
  end

  post '/chitter/users' do
    @user = User.create(params[:first_name], params[:last_name], params[:email], params[:username], params[:password])
    if @user
      session[:user_id] = @user.user_id
      redirect('/chitter')
    else
      redirect('/chitter/users/new')
    end
  end

  get '/chitter/sessions/new' do
    erb(:login)
  end

  post '/chitter/sessions' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.user_id
      redirect('/chitter')
    else
      redirect('/chitter/sessions/new')
    end
  end

  get '/chitter/sessions/logout' do
    session.clear
    redirect('/chitter')
  end

  run! if app_file == $0

end

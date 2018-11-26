require 'pg'
require 'uri'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'


class Controller < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    redirect '/home'
  end

  get '/home' do
    erb :home
  end

  get '/peeps' do
    @users = User.list
    erb :peeps
  end

  get '/users/user_new' do
    erb :"users/user_new"
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  get '/sessions/session_new' do
    erb :"sessions/session_new"
  end

  post '/sessions' do
    @user = User.authenticate(password: params[:password], username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your username or password.'
      redirect('/sessions/session_new')
    end
  end

  delete '/peeps/:id' do
    User.delete(id: params[:id])
    redirect '/peeps'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/sessions/session_new')
  end

  get '/peeps/:id/peep_new' do
    @user_id = params[:id]
    erb :'/peeps/peep_new'
  end

  post '/peeps/:id' do
    Peep.write(user_id: params[:id], text: params[:text], mytime: params[:mytime])
    redirect '/peeps'
  end

  run! if app_file == $0
end

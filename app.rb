require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do 
    redirect '/feed'
  end

  get '/feed' do 
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'feed/index'
  end

  post '/feed' do
    @user = User.find(id: session[:user_id])
    Peep.create(message: params[:peep], user_id: @user.id)
    redirect('/feed')
  end

  delete '/feed/:id' do 
    Peep.delete(id: params[:id])
    redirect('/feed')
  end

  get '/feed/:id/edit' do 
    @peep = Peep.find(id: params[:id])
    erb :'feed/edit'
  end

  patch '/feed/:id' do 
    Peep.update(id: params[:id], message: params[:peep])
    redirect('/feed')
  end

  get '/users/new' do 
    erb :'users/new'
  end

  post '/users' do 
    user = User.create(email: params['email'], password: params['password'], name: params['name'], username: params['username'])
    session[:user_id] = user.id
    redirect '/feed'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/feed')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy'do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/feed')
  end 

  run! if app_file == $PROGRAM_NAME
end
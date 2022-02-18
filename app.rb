require 'sinatra'
require "sinatra/reloader" if development?
require 'pg'
require './lib/peep'
require './lib/user'
require './database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash
  enable :sessions


  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find_by_id(id: session[:user_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    peep = Peep.create(peep: params[:peep])
    redirect to "/peep/#{peep.id}"
  end

  get '/peep/:id' do
    @peep =  Peep.find_by_id(id: params[:id])
    erb :"peeps/show"
  end

  get '/users/new' do
    erb :"users/new"
  end
  
  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/delete' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end


  # Start the server if this file is executed directly 
  run! if app_file == $0
end

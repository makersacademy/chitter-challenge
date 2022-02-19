require 'sinatra'
require "sinatra/reloader" if development?
require 'pg'
require './lib/peep'
require './lib/user'
require './database_connection_setup'
require 'sinatra/flash'
require 'action_view'

include ActionView::Helpers::DateHelper

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/reply' do
    @peep = Peep.find_by_id(id: params[:peep_id])
    erb :reply
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
    peep = Peep.create(
      peep: params[:peep], user_id: session[:user_id], 
      parent_peep_id:params[:parent_peep_id] )
    redirect to "/peeps"
  end

  get '/peep/:id' do
    @peep =  Peep.find_by_id(id: params[:id])
    erb :"peeps/show"
  end

  get '/users/new' do
    erb :"users/new"
  end
  
  post '/users' do
    user = User.create(
      email: params['email'], password: params['password'], 
      name: params['name'], user_name: params['user_name']
    )
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Email or Username already in use!'
      redirect('/users/new')
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
    else
      flash[:notice] = 'Please check your email or password.'
    end
    redirect('/peeps')
  end

  post '/sessions/delete' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  # Start the server if this file is executed directly 
  run! if app_file == $0
end

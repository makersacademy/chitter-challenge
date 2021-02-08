require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require 'sinatra/flash'
require './lib/user'
require_relative './session_helper'

class Chitter < Sinatra::Base 
  enable :sessions, :method_override
  register Sinatra::Flash
  include SessionHelper

  get '/' do
    erb :'homepage/sign_in'
  end

  get '/peeps' do
    @user = User.find(user_id: session[:user_id])
    @peeps = Peep.all
     session[:peep_user_id] = session[:user_id]
    erb :'peeps/index'
  end

  post '/peeps' do
    new_peep = Peep.create(peep_content: params[:peep_content], peep_user_id: session[:user_id])
    session[:new_peep] = new_peep.id
    session[:peep_user_id] = session[:user_id]
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], user_name: params[:user_name])
    session[:user_id] = user.user_id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.user_id
      redirect '/peeps'
    else
      flash[:notice] = "Please check your email or password."
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have signed out."
    redirect '/peeps'
  end

  run! if app_file == $0

end
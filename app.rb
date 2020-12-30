
# HARDER User Stories:
# Log in to post peeps
# Add name of maker and user handle to peeps.
# Log out

require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user.rb'
require_relative './database_connection.rb'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all.order(created_at: :desc)
    @user = User.find(session[:user]) unless session[:user].nil?
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/save_peep' do
    Peep.create(params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/save_user' do
    duplicate = User.check_duplicate(params[:user])
    if duplicate.nil?
      user = User.create(params[:user])
      redirect "/users/#{user.id}/welcome"
    else
      flash[:notice] = duplicate
      redirect '/users/new'
    end
  end

  get '/users/:id/welcome' do
    @user = User.find_by(id: params[:id])
    erb :'users/welcome'
  end
end

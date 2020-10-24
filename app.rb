require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require 'pg'
require './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    @peeps = Peep.all
    @user = User.find(session[:id]) unless session[:id] == nil
    erb :'chitter/index'
  end

  get '/chitter/peep/new' do
    erb :'chitter/peep/new'
  end

  post '/chitter' do
    Peep.create(params[:peep])
    redirect to '/chitter'
  end

  get '/users/new' do
    erb :'chitter/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:id] = user.id
    redirect to '/chitter'
  end

  get '/chitter/sessions/new' do
    erb :'chitter/sessions/new'
  end

  post '/chitter/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:id] = user.id
      redirect to '/chitter'
    else 
      flash[:notice] = "Check your email or password."
      redirect to '/chitter/sessions/new'
    end
  end

  post '/chitter/sessions/destroy' do
    User.sign_out
    session[:id] = nil
    flash[:notice] = "Logged out"
    redirect('/chitter')
  end
end

require 'pg'
require 'uri'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './database_connection_setup'


class Controller < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :home
  end

  get '/peeps_page' do
    @user = User.find(id: session[:user_id])
    erb :peeps
  end

  get '/users/user_new' do
    erb :"users/user_new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps_page'
  end

  get '/sessions/session_new' do
    erb :"sessions/session_new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peeps_page')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/session_new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peeps_page')
  end

  run! if app_file == $0
end

require_relative './lib/peep'
require_relative './lib/user'
require_relative './lib/comment'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end
  enable :sessions, :method_override

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    user_id = User.find(session[:user_id]).id unless session[:user_id].nil?
    Peep.create(params[:peep], user_id)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    user = User.create(email: params[:email], password: params[:password], 
    name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions/new' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'You have entered incorrect details'
      redirect('/sessions/new')
    end    
  end

  post '/sessions/destroy' do
    session.clear
    # flash[:notice] = 'You have signed out'
    redirect('/peeps')
  end

  get '/peeps/:id/comments/new' do
    @peep_id = params[:id]
    erb :"comments/new"
  end

  post '/peeps/:id/comments/new' do
    Comment.create(comment: params[:comment], peep: params[:id], maker: session[:user_id])
    redirect '/peeps'
  end

  run! if app_file == $0
end

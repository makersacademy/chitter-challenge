require 'sinatra/base'
require 'sinatra/flash'
require 'time'

require_relative './lib/peer'
require_relative './lib/user'
require_relative "./database_connection_setup.rb"

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    'Chitter'
  end

  get '/peers' do
    @user = User.find(id: session[:user_id])
    @peers = Peer.all
    erb :"peers/index"
  end

  get "/peers/add" do
    erb :"peers/add"
  end

  post "/peers/add" do
    flash[:notice] = "You must be logged in to post." unless 
    Peer.create(user_id: session[:user_id], content: params[:content])
    redirect("/peers")
  end

  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.create(email: params['email'], password: params['password'],
                        name: params['name'], username: params['username'])
    session[:user_id] = user.id
    redirect "/peers"
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peers')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peers')
  end

   run! if app_file == $0
end

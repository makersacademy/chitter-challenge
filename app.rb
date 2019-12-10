require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'pg'
require './database_connection_setup'

class Peeps < Sinatra::Base
  enable :sessions

  get '/' do
    erb :"root/index"
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(name: params[:name], handle: params[:handle], message: params[:message])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], handle: params[:handle])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run if app_file == $0
end

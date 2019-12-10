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
    @current_user = User.find(id: session[:user_id])
    redirect '/' if @current_user.nil?
    @peeps = Peep.all
    erb :"peeps/index"
  end

  post '/peeps' do
    Peep.create(message: params[:message], user_id: session[:user_id])
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

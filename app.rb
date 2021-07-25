require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'
require './lib/user.rb'
require 'pg'
require_relative 'database_connection_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end
  
  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  get '/post' do
    erb :post
  end

  post '/peeps' do
    @peep = params[:peep]
    Peep.add(@peep)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    @email = params[:email]
    @password = params[:password]
    user = User.create(email: @email, password: @password)
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  run! if app_file == $0

end

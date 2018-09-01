# app.rb
require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require './lib/database_connection'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions, :method_override # allows us to use patch, delete etc

  get '/' do
    @current_user = session[:current_user]
    @peeps = Peep.all
    erb(:index)
  end

  post '/peep' do
    id = session[:current_user].id
    Peep.create(params[:peep], id)
    redirect '/'
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    session[:current_user] = User.signup(params)
    redirect '/'
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    User.login(params)
    redirect '/'
  end

  post '/logout' do
    session[:current_user] = nil
    redirect '/'
  end

  run! if app_file == $0
end

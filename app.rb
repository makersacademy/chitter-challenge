require 'sinatra/base'
require './lib/peep'
require_relative './lib/user'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "My session secret"

  get '/' do
    @user = User.find(
      id: session[:user_id]
    )
    @peeps = Peep.peeps
    erb :index
  end

  get '/peep/new' do
    erb :'/peep/new'
  end

  post '/' do
    Peep.create_peep(peep: params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect '/'
  end

  run! if app_file == $0
end

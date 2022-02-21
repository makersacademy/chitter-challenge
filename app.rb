require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps.rb'
require './database_connection_setup'
require './lib/user.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end
  
  get '/feed' do
    @user = User.find(session[:user_id])
    @feed = Peeps.all
    erb :'feed'
  end

  post '/feed' do
    Peeps.create(peep: params[:peep])
    redirect '/feed'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/feed'
  end

  run! if app_file == $0

end
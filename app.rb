require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    'hello'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/feed' do
    session[:username] = params[:username]
    redirect '/feed'
  end

  get '/feed' do
    "Welcome, #{session[:username]}"
  end

end
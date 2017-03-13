require 'sinatra/base'
require_relative './models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/thanks' do
    redirect '/thanks'
  end

  get '/thanks' do
    erb :thanks
  end

  get '/login' do
    erb :login
  end

  post '/verify' do
    redirect '/verify'
  end

end

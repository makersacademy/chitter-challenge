require 'sinatra/base'
require 'sinatra/flash'

require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash


  get '/main' do
    erb :'main/index'
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/main'
  end

  get '/users/new' do
    erb :"users/new"
  end


  run! if app_file == $0
end
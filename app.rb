require 'sinatra/base'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    'hello world'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(
      email: params['email'],
      username: params['username'],
      first_name: params['first_name'],
      last_name: params['last_name'],
      password: params['password'],
      password_confirm: params['password_confirm'])
    redirect '/new_user_confirmation'
  end

  run! if app_file == $0
end

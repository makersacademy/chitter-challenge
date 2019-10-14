require 'sinatra/base'
require './lib/message'
require './database_connection_setup'
require './lib/users'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    p @user = User.find(id: session[:user_id])
    @peeps = Message.all
    erb(:homepage)
  end

  get '/peep/new' do
    erb(:'peeps/new')
  end

  post '/peep/new' do
    Message.create(text: params['message'])
    redirect '/'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'], name: params['name'], username: params['username'])
    session[:user_id] = user.id
    redirect '/'
  end

  run if app_file == $0

end

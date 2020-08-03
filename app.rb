require 'sinatra/base'
require './lib/users.rb'
require './lib/messages.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/' do
    erb :index
  end

  post '/greeting' do
    user = User.create(name: params['name'], email: params['email'], password: params['password'])
    @name = params['name']
    session[:user_id] = DatabaseConnection.query("SELECT id FROM users WHERE name = '#{@name}';")
    erb :greeting
  end

  get '/chitter' do
    @messages = Message.all
    @users = User.all
    erb :chitter
  end

  post '/chitter' do
    Message.create(session[:user_id], params['message'])
    redirect '/chitter'
  end

  run! if app_file == $0
end

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'
require './lib/user'
require './lib/database_connection'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.current
    @peeps = Message.all
    erb(:index)  
  end

  get '/register' do
    erb(:register)
  end

  post '/' do
    Message.post(params['peep'])
    redirect('/')
  end

  post '/register' do
    User.create(
      params['first_name'], 
      params['last_name'], 
      params['username'], 
      params['email'], 
      params['password']
    ) 
    # User.login()
    # User.logout()
    redirect('/')
  end
end

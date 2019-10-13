require 'sinatra/base'
require './lib/message'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
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
    "Hello World"
    erb(:'users/new')
  end

  post '/users' do
    User.create(email: params['email'], password: params['password'], name: params['name'], username: params['username'])
    redirect '/'
  end

  run if app_file == $0

end

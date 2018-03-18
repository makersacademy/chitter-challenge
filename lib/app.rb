require 'sinatra/base'
require_relative 'peep'
require_relative 'user'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/new-peep' do
    @peeps = Peep.all
    Peep.create(username: params['username'], message: params['message'])
    redirect('/')
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post 'new-user' do
    User.create(email: params['email'], name: params['name'], username: params['username'], password: params['password'])
    redirect('/')  
  end

run! if app_file == $0
end

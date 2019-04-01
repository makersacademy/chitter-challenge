require 'sinatra/base'
require './app/lib/peep'
require './app/lib/user'
require './app/lib/database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all

    erb :index
  end

  post '/create-peep' do
    Peep.create(peep: params[:peep])

    redirect '/'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])

    redirect '/'
  end

  run! if app_file == $0

end
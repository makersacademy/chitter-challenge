require 'sinatra/base'
require './lib/peep'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.peeps
    erb :index
  end

  get '/peep/new' do
    erb :'/peep/new'
  end

  post '/' do
    Peep.create_peep(peep: params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/new' do
    # create new user
    redirect '/'
  end

  run! if app_file == $0
end

require 'sinatra/base'
require './lib/peep.rb'
require './lib/database_connection.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @username = session[:username]
    @peeps = Peep.list
    erb :index
  end

  post '/' do
    Peep.create(message: params[:message])
    redirect '/'
  end

  get '/create_peep' do
    erb :create_peep
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session[:username] = params[:username]
    redirect '/'
  end
  run! if app_file == $0
end

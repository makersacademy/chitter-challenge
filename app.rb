require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require './spec/database_connection_setup.rb'
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.display
    erb :'chitter/index'
  end

  post '/chitter' do
    Peep.create(peep: params[:peep])
    redirect '/chitter'
  end

  get '/chitter/signup' do 
    erb :'/chitter/signup'
  end

  get '/chitter/welcome' do
    erb :'/chitter/welcome'
  end

  get '/chitter/login' do
    erb :'/chitter/login'
  end


  run! if app_file == $0
end
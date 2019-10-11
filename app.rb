require 'sinatra/base'
require './lib/peep'
require 'pg'
require './database_connection_setup'

class Peeps < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    peep = params['peep']
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}');")
    redirect '/peeps'
  end

  run if app_file == $0
end

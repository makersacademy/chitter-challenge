require 'sinatra/base'
# require 'pg'
require './lib/peep'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    # "Welcome to Chitter"
    # p Peep.all
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    erb :peep
  end

  post '/peep/new' do
# p "fdasfdsfdsa"
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'chitter_test')
    # else
    #   connection = PG.connect(dbname: 'chitter')
    # end
    # connection = PG.connect(dbname: 'chitter')
    # p connection

    sql = %{INSERT INTO peeps
      (peep) VALUES ('#{params[:peep]}') RETURNING id, peep;}
      # p sql
    DatabaseConnection.query(sql)
    redirect '/'
  end

  run! if app_file == $0

end

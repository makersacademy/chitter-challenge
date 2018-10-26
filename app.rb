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

  get '/peep' do
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

    # sql = %{INSERT INTO peeps
    #   (peep) VALUES ('#{params[:peep]}') RETURNING id, peep;}
    #   # p sql
    # DatabaseConnection.query(sql)
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/user/register' do
    erb :register
  end

  post '/user/new' do

    sql = %{INSERT INTO users
      (firstname, lastname, username, password, email)
      VALUES ('#{params[:firstname]}', '#{params[:lastname]}',
        '#{params[:username]}', '#{params[:password]}', '#{params[:email]}')
        RETURNING id, firstname, lastname, username, password, email;}
      # p sql
    user = DatabaseConnection.query(sql)
    "<p>You have signed up, #{user[:firstname]} #{user[:lastname]}</p><p>Your username is: #{user[:username]}</p><p>The email address you have registered with is #{user[:email]}</p>"
  end

  run! if app_file == $0

end

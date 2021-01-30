require 'sinatra'
require 'pg'

class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    connection = PG.connect(dbname: 'chitter_chatter')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{params[:new_peep]}') RETURNING id, peep;" )
    redirect ('/peeps')
  end

  get '/peeps' do
    connection = PG.connect(dbname: 'chitter_chatter')
    result = connection.exec("SELECT * FROM peeps;")
    @peeps = result.first
    erb :peeps
  end

  run! if app_file == $0
end

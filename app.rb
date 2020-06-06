require 'sinatra/base'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
   erb :'peeps/new'
 end

  post '/peeps' do
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter_test')
    end
    connection.exec("INSERT INTO peeps (content) VALUES ('#{params[:content]}');")
    redirect '/'
  end


end

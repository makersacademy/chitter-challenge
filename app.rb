require_relative 'lib/peep'
require 'pg'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    connection = PG.connect(dbname: 'chitter_test')
    @peeps = connection.exec('SELECT * FROM peeps
                             ORDER BY id DESC')
    erb :view_peeps
  end

  post '/peep' do
    Peep.create(params[:peep_content])
    redirect '/'
  end
end

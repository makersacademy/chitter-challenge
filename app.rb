require 'pg'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :view_peeps
  end

  post '/peep' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (content)
                    VALUES ('#{params[:peep_content]}')")
  end
end

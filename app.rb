require 'sinatra/base'
require 'peep'

class Chitter < Sinatra::Base
  get '/' do

    @peeps = Peep.view_all
    erb :index
  end

  post '/post-peep' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect '/'
  end

  run! if app_file == $0
end

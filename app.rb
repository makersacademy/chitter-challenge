require 'sinatra/base'
require './lib/peeps'
require './lib/timestamp'
class ChitterApp < Sinatra::Base
  get '/chitter' do
    @peeps = Peep.all
    erb :messages
  end

  post '/chitter' do
    @time = Inputtime.timestamp
    @peep = Peep.create(peeps: params['message'],timestamp: @time) 

    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (peeps) VALUES('#{peep}')")
    redirect '/chitter'
  end
  run! if app_file == $0
end

require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :chitter_feed
  end

  post '/' do
    peep = params['text']
    connection = PG.connect(dbname: 'posted_peeps_test')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}');")
    redirect '/'
  end

  run! if app_file == $0
end
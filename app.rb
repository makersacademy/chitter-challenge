require 'sinatra/base'
require_relative 'lib/peep.rb'
require 'pg'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    erb :index
  end

  post '/chitter' do
    connection = PG.connect(dbname: 'chitter_test_database')
    connection.exec("INSERT INTO peeps(content, created_at) VALUES('#{params['content']}', NOW());")
    redirect '/chitter'
  end

  run! if app_file == $0

end

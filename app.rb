require 'pg'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    connection = PG.connect(dbname: 'chitter_test')
    @peeps = connection.exec('SELECT * FROM peeps')
    erb(:index)
  end

  run! if app_file == $0
end

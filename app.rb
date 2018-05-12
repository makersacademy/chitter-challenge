require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get ('/') do
    @peeps = []
    connection = PG.connect(dbname: 'Chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| @peeps << { text: peep['text'], author: peep['author'] } }
    erb(:index)
  end

end

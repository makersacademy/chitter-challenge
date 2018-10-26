require 'sinatra/base'
require './lib/message'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitterdb_test')
    else
      connection = PG.connect(dbname: 'chitterdb')
    end
    
    result = connection.exec("SELECT * FROM messages ORDER BY message_date LIMIT 10;")
    @messages = result.map { |message|
      { date: message['message_date'], text: message['message_text'], handle: message['author_handle'] } }
    erb :index
  end

end



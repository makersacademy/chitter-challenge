require 'sinatra/base'
require_relative 'lib/message'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Message.all
    erb :index
  end

  get '/write-peep' do
    erb :write_peep
  end

  post '/peeps' do
    content = params['content']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO messages (content) VALUES('#{content}')")
    redirect '/'
  end


  run! if app_file == $0

end

require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  get '/' do
    'Hello world'
  end

  get '/peep' do
    erb :peep
  end

  post '/peep' do
    post = params['post']
    con = PG.connect(dbname: 'chitter')
    con.exec("INSERT INTO posts (post) VALUES('#{post}')")
    redirect '/peep'
  end

  run if app_file == $PROGRAM_NAME
end

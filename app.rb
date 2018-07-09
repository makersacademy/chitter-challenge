require 'sinatra/base'
require 'pg'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Hello world'
  end

  get '/peep' do
    @posts = Peep.all
    @time = [
      '2005-05-13 07:15:31.123456789',
      '2005-05-13 07:15:31.123456789',
      '2005-05-13 07:15:31.123456789'
    ]
    erb :peep
  end

  post '/peep' do
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    post = params['post']
    con.exec("INSERT INTO posts (post) VALUES('#{post}')")
    redirect '/peep'
  end

  run if app_file == $PROGRAM_NAME
end

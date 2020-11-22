require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  get '/' do
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    @peeps = connection.exec('SELECT * FROM peeps ORDER by id DESC;')
    @results = @peeps.map { |peep| peep['post'] }
    erb :index
  end

  get '/post_peep' do
    erb :'post_peep'
  end

  post '/post_peep' do
    peep = params['peep']
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (post) VALUES('#{peep}')")
    redirect '/'
  end


  run! if app_file == $0
end

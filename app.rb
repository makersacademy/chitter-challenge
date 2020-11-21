require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/post_peep' do
    erb :'post_peep'
  end

  post '/post_peep' do
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (post) VALUES('#{peep}')")
    redirect '/'
  end

  run! if app_file == $0
end

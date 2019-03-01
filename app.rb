require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    '<a href="/peeps">See the peeps</a>'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    text = params['text']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("insert into peeps (text) values ('#{text});")
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0

end

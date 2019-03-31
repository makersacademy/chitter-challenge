
require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/feed' do
    @peeps = Peep.all
    erb :index
  end

  get '/feed/create' do
    erb :"feed/create"
  end

  post '/feed' do
    content = params['content']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
    redirect '/feed'
  end

  run! if app_file == $0
end

require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    content = params['content']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (content) VALUES #{content}')'")
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

end

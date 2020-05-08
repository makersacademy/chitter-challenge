require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb:'peeps/index'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO bookmarks (message) VALUES('#{message}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end
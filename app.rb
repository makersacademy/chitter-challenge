require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps/new' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (url) VALUES('#{message}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end

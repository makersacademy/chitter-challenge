require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/add' do
    erb :'peeps/add'
  end

  post '/peeps' do
    message = params[:message]
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}');")
    redirect '/peeps'
  end

  run! if app_file == $0
end
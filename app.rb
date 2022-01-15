require 'sinatra/base'
require 'sinatra/reloader'
require 'peeps'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
    also_reload 'app.rb'
  end 

  get '/' do
    'Chitter'
  end

  get '/chitter' do
    connection = PG.connect(dbname: 'chitter')
    @message = connection.exec_params("SELECT * FROM peeps;")
    p @message.first
    erb :chitter
  end

  get '/chitter/new_peep' do
    erb :new_peep
  end

  post '/chitter/new_peep' do
    Peeps.post(params[:message])
    redirect '/chitter'
  end

  run! if app_file == $0
end


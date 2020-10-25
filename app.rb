require 'sinatra/base'
require_relative './models/peep'

class ChitterApp < Sinatra::Base 

  enable :sessions

  get '/' do
    @peeps = Peep.list_ordered_peeps
    p @peeps
    erb :index
  end

  post '/create-peep' do
    connection = PG.connect :dbname => 'peeps_test_manager'
    connection.exec "INSERT INTO peeps (message, creator) VALUES ('#{params[:message]}', '#{params[:username]}');"
    redirect to '/'
  end

  run! if app_file == $0
end

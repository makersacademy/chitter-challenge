require 'sinatra/base'
require './lib/db_connection'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  before do
    DbConnection.check_env
  end

  get '/' do
    erb :index
  end

  post '/peep' do
    Chitter.send_peep(params[:message], params[:id])
    redirect '/'
  end

  run! if app_file == $0
end

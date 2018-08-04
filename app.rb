require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/new' do
    Peep.create(params)
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME

end

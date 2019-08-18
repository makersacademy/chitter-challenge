require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class ChitterWeb < Sinatra::Base
  database_connection_setup
  enable :sessions, :method_override

  get '/' do
    "Hello, world!"
  end 

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $PROGRAM_NAME
end
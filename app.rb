require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps/' do
    @peeps = Peep.all
    erb :'index'
  end

  run! if app_file == $PROGRAM_NAME
end

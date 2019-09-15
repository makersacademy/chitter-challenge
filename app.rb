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

  get '/peeps/new_peep/' do
    erb :'new_peep'
  end

  post '/peeps/new_peep/' do
    Peep.new_peep(params[:peep])
    redirect '/peeps/'
  end

  run! if app_file == $PROGRAM_NAME
end

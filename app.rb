require 'sinatra/base'
require_relative 'database_connection_setup'
require './lib/user'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $PROGRAM_NAME
end

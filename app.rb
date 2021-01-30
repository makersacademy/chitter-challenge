require 'sinatra'
require_relative "lib/peep"
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
  end

  run! if app_file == $0
end

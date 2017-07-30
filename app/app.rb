require 'sinatra/base'
require_relative './models/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end

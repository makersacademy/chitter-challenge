require 'sinatra/base'
require './models/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end
  
  run! if app_file == $0
end

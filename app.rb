require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    p ENV    
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0

end

require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

end

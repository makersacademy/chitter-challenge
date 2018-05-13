require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.new
    erb :index
  end

end

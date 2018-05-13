require 'sinatra/base'
require './lib/peep'

class PeepManager < Sinatra::Base

  get '/' do
    @peep = Peep.all
  erb :index
  end

  run! if app_file == $0
end

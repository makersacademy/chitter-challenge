require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all 
    erb :index
  end

  run! if app_file == $0
end

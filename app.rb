require 'sinatra/base'
require './lib/peep.rb'

class PeepManager < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"/peeps/index"
  end
end

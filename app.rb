require 'sinatra/base'
require './lib/peep.rb'

class ChitterChallenge < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

end
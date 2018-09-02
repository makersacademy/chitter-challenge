require 'sinatra/base'
require './lib/peep.rb'


class ChitterChallenge < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps/index' do
    @peeps = Peep.all
    erb(:peeps)
  end

end
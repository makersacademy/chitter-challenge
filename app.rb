require 'sinatra/base'
require './lib/peep.rb'

class ChitterChallenge < Sinatra::Base
  get '/' do 
    "Peep test message"
  end

  get '/chitter' do 
    p ENV
    @peeps = Peep.read
    erb :'chitter/index'
  end

  run! if app_file == $0
end
  
require 'sinatra/base'
require_relative './models/peep.rb'

class Chitter < Sinatra::Base

  get '/peep/all' do
    @peeps = Peep.all
    erb(:'peep/all')
  end

end

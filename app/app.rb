require 'sinatra/base'
require_relative 'models/peep'

class Chitter_Challenge < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

end

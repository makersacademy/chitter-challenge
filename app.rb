require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @result = Peep.all
    erb(:index)
  end

end

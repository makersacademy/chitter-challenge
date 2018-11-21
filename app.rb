require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

end

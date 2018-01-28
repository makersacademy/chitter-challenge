require 'sinatra'
require './app/models/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :peeps
  end
end

require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :home
  end

end

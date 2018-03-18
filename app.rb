require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    @peep = Peep.all
    erb :"peeps/index"
  end

  run! if app_file == $0
end

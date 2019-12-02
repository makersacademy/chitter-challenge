require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    # @peeps = [
    #   "Hello World!",
    #   "I am feeling sunny today!",
    #   "Minions will takeover the world."
    # ]
    # @peeps.join
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0

end

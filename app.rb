require 'sinatra/base'
require 'pg'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    # @peeps = [
    #   "Hello World!",
    #   "I am feeling sunny today!",
    #   "Minions will takeover the world."
    # ]
    # @peeps.join
    p ENV
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0

end

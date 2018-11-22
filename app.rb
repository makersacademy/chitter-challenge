require 'sinatra/base'
require './database_connection_setup'
require './lib/Peep'
require './lib/User'

class ChitterApp < Sinatra::Base
  run! if app_file == $0

  get '/' do
    @peeps = Peep.retrieve_multiple_peeps(limit: 20)
    p @peeps
    erb(:index)
  end

end

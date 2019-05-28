require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter and Peeps'
  end

  get '/peeps' do
    # @peeps = [
    #           "my first peep",
    #           "my second peep",
    #           "my third peep"
    #          ]
    @peeps = Peep.all
    # peeps.join
    erb :'peeps/index'
  end
  run! if app_file == $0
end

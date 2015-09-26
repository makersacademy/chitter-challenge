require 'sinatra/base'
require_relative 'data_mapper_setup'

class ChitterChallenge < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

# start the server if ruby file executed directly
run! if app_file == ChitterChallenge
end

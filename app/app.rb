require 'sinatra/base'
require_relative 'data_mapper_setup'

class ChitterApp < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

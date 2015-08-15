require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/controllers/base_controller'
require './app/controllers/chitter_controller'

module ChitterApp
  class ChitterWeb < Sinatra::Base
    use Routes::Base
    use Routes::ChitterController

  # start the server if ruby file executed directly
  run! if app_file == $0
  end
end

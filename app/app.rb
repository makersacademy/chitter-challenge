ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'controllers/maker_controller'
require_relative 'controllers/peep_controller'
require_relative 'controllers/base_controller'

  class ChitterWebApp < Sinatra::Base

    use Routes::BaseController
    use Routes::MakerController
    use Routes::PeepController

    run! if app_file == $PROGRAM_NAME
  end

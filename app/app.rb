ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require_relative 'helpers'
require_relative 'controllers/peep_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/session_controller'
require_relative 'controllers/application_controller'

class Chitter < Sinatra::Base

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
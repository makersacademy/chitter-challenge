ENV['RACK_ENV'] ||= 'development'
require_relative 'chitter_setup'
require_relative './helpers/chitter_helpers'

class Chitter < Sinatra::Base
end

require_relative 'controllers/application_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/peep_controller'

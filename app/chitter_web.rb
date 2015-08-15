require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'controllers/base_controller'
require_relative 'controllers/peep_controller'
require_relative 'controllers/user_management_controller'

module ChitterApp
  class ChitterWeb < Sinatra::Base
    use Routes::Base
    use Routes::PeepController
    use Routes::UserManagementController

  # start the server if ruby file executed directly
  run! if app_file == $0
  end
end

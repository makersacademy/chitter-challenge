require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './data_mapper_setup'
require './app/helpers/app_helpers'
require './app/controllers/base_controller'
require './app/controllers/home_controller'
require './app/controllers/user_controller'
require './app/controllers/session_controller'
require './app/controllers/peep_controller'

include TheApp::Models

module TheApp

  class Chitter < Sinatra::Base
    include AppHelpers
    register Sinatra::Flash
    register Sinatra::Partial

    use Routes::UserController
    use Routes::SessionController
    use Routes::PeepController
    use Routes::HomeController
  end

end

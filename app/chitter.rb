require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'
require './app/controllers/base'
require './app/controllers/user_controller'
require './app/controllers/session_controller'
require './app/controllers/peep_controller'
require './app/controllers/home_controller'

module Armadillo
  class Chitter < Sinatra::Base

    use Routes::UserController
    use Routes::SessionController
    use Routes::PeepController
    use Routes::HomeController

    # run! if app_file == $0
  end
end
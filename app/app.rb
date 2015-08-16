require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './controllers/controller_load.rb'

module Bamboo
  class Chitter < Sinatra::Base

    use Routes::AppController
    use Routes::UserController
    use Routes::SessionController
    use Routes::PeepController

    run! if app_file == $0
  end
end

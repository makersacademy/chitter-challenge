require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/helpers'
require 'sinatra/flash'
require './app/controllers/base_controller'
require './app/controllers/user_controller'
require './app/controllers/peep_controller'

include ChitterApp::Models
module ChitterApp

  class Chitter < Sinatra::Base

    use Routes::UserController
    use Routes::PeepController

    get '/' do
      erb :'peeps/index'
    end

    run! if app_file == Chitter

  end
end

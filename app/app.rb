require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'
require './app/helpers/apphelpers'
require './app/controllers/base'
require './app/controllers/home'
require './app/controllers/user'
require './app/controllers/peeps'

include ChitterModule::Models

module ChitterModule

  class Chitter < Sinatra::Base

    use Routes::HomeController
    use Routes::UserController
    use Routes::PeepController

    # start the server if ruby file executed directly
    run! if app_file == $0

  end

end
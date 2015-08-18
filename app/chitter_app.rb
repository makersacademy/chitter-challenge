require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './data_mapper_setup'

require './app/helpers/app_helpers'

Dir["./app/controllers/*.rb"].each {|file| require file }


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

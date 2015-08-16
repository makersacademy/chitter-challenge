require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'
require_relative 'helpers/app_helpers'
require_relative 'controllers/base'

Dir[__dir__ + '/controllers/*.rb'].each(&method(:require))

include Chitter::Models

module Chitter

  class MyApp < Sinatra::Base

    use Routes::Mainpage
    use Routes::Peeps
    use Routes::Sessions
    use Routes::Users

  end

end

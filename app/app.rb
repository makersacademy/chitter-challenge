require 'sinatra/base'
require 'sinatra/flash'

require_relative 'helpers/app_helper'
require_relative 'data_mapper_setup'
Dir[__dir__ + '/controllers/*.rb'].each(&method(:require))

include Armadillo::Models

module Armadillo

  class App < Sinatra::Base

    use Routes::Homepage
    use Routes::Users

  end

end
require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'helpers/app_helper'
require_relative 'controllers/base'
Dir[__dir__ + '/controllers/*.rb'].each(&method(:require))

include Chitter::Models

module Chitter
  class MyApp < Sinatra::Base
    use Routes::Homepage
    use Routes::Users
    use Routes::Sessions
    use Routes::Peeps
  end
end

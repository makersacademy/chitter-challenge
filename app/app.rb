require 'sinatra/base'

require_relative 'data_mapper_setup'
require_relative 'controllers/base'

Dir[__dir__ + '/controllers/*.rb'].each(&method(:require))

module Chitter
  class MyApp < Sinatra::Base
    use Routes::Mainpage
  end
end

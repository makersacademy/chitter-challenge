require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'controllers/base'
Dir[__dir__ + '/controllers/*.rb'].each(&method(:require))

include BookmarkManager::Models

module Chitter
  class MyApp < Sinatra::Base
    use Routes::Homepage
    use Routes::Users
  end
end

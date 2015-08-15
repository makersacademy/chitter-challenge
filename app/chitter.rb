require './app/data_mapper_setup'

require './app/controllers/base'
require './app/controllers/user'


module Application
  class Chitter < Sinatra::Base
    use Routes::XUser
  end
end
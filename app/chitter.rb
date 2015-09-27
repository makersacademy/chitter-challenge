require './app/data_mapper_setup'
require 'sinatra/base'

require './app/controllers/base'
require './app/controllers/chit_controllers'
# require './app/controllers/user_controllers'
# require './app/controllers/session_controllers
require './app/models/chit_model'
require './app/models/user_model'
module Chatter
  class Chitter < Sinatra::Base
    use Models::Chit
    use Models::User
    use Routes::Chit
    # use Routes::User
    # use Routes::Session


    # start the server if ruby file executed directly
    run! if app_file == $PROGRAM_NAME
end
end

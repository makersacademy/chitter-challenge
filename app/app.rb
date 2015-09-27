require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require './app/controllers/base'
require './app/controllers/users'
require './app/controllers/sessions'
require './app/controllers/peeps'

module Chitter

  class ChitterApp < Sinatra::Base

    use Routes::Users
    use Routes::Sessions
    use Routes::Peeps

    # start the server if ruby file executed directly
    run! if app_file == $PROGRAM_NAME
  end

end

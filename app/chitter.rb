require 'sinatra/base'
require_relative 'data_mapper_setup'
# require 'sinatra/flash'
require './app/controllers/base'
require './app/controllers/users'
require './app/controllers/sessions'
require './app/controllers/peeps'

module ChitterApp

  class Chitter < Sinatra::Base

    use Routes::Users
    use Routes::Sessions
    use Routes::Peeps

    # start the server if ruby file executed directly
    run! if app_file == $0
  end

end

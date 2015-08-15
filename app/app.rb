require 'sinatra/base'
require './data_mapper_setup'
require './app/controllers/base'
require './app/controllers/home'
require './app/controllers/user'

include ChitterModule::Models

module ChitterModule

  class Chitter < Sinatra::Base

    use Routes::HomeController
    use Routes::UserController

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
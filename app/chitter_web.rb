require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require './app/controllers/base_controller'
require './app/controllers/user_controller'

module ChitterApp
  class Chitter < Sinatra::Base
    use Routes::UserController
    register Sinatra::Flash
    get '/' do
      erb :'index'
    end
  end
end

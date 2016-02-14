ENV['RACK_ENV'] ||= 'development' ####
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'
require_relative 'controllers/replies'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

   # start the server if ruby file executed directly
  run! if app_file == $0
end

ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'tilt/erb'

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

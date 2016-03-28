ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'server'
require_relative 'data_mapper_setup'
require_relative 'controllers/user'
require_relative 'controllers/session'
require_relative 'controllers/peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'sanitize'
require_relative 'data_mapper_setup.rb'

require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

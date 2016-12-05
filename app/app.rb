ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'helpers'

require_relative 'controllers/peeps'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
# require_relative 'controllers/server'

class Chitter < Sinatra::Base

  set :root, File.dirname(__FILE__)

  get '/' do
    "Hello Chitter"
  end


  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions

  helpers Helpers

  run! if app_file == $0

end

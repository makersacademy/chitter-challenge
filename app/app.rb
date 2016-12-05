ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
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
  register Sinatra::Partial
  use Rack::MethodOverride
  enable :sessions
  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers Helpers

  run! if app_file == $0

end

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'helpers'

require_relative 'controllers/peep'
require_relative 'controllers/user'
require_relative 'controllers/session'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions

  set :root, File.dirname(__FILE__)

  get '/' do
    redirect('/peep/latest_first')
  end

  helpers Helpers

  run! if app_file == $0

end

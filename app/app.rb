ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

require_relative './models/user'
require_relative './models/peep'

require_relative 'chitter_helpers'

class Chitter < Sinatra::Base

  enable  :sessions
  set :session_secret, 'super secret'
  set :root, File.dirname(__FILE__)
  set :app_file, __FILE__

  use Rack::MethodOverride

  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all(:order => [ :id.desc ])
    erb :'peeps/index'
  end

  helpers Helpers

  # start the server if ruby file executed directly
  run! if app_file == $0
end

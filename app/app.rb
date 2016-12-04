ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

require_relative './models/user'
require_relative './models/peep'

class Chitter < Sinatra::Base

  enable  :sessions
  set :session_secret, 'super secret'
  set :root, File.dirname(__FILE__)

  use Rack::MethodOverride

  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all(:order => [ :id.desc ])
    erb :'peeps/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep.rb'
require_relative 'models/user.rb'
require_relative 'controllers/sessions.rb'
require_relative 'controllers/peeps.rb'
require_relative 'controllers/users.rb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views'
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end

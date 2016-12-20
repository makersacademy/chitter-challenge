ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

require_relative 'helpers'


class Chitter < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'
	set :views, File.expand_path('../views', __FILE__)
	register Sinatra::Flash
	use Rack::MethodOverride

	include Helpers

end

require_relative 'controllers/sessions_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/peeps_controller'
class Chitter < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'
	register Sinatra::Flash
	use Rack::MethodOverride

	include Helpers

	run! if app_file == $0

end
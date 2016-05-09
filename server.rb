class Chitter < Sinatra::Base

	use Rack::MethodOverride
	register Sinatra::Flash
	enable :sessions
	set :session_secret, 'super secret'
  set :root, File.dirname(__FILE__)

	def current_user
		@current_user ||= User.get(session[:current_user_id])
	end

end
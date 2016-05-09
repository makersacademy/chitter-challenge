class Chitter < Sinatra::Base

	use Rack::MethodOverride
	register Sinatra::Flash
	enable :sessions
	set :session_secret, 'super secret'

	def current_user
		#on sign-out current user should default back to nil
		if session[:current_user_id]
			@current_user ||= User.get(session[:current_user_id])
		end
	end

end
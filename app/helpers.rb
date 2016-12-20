module Helpers

	def current_user
		@current_user ||= User.get(session[:user_id])
	end

	def current_time
		Time.now.strftime("%l:%M%P, %e %b %Y")
	end

end
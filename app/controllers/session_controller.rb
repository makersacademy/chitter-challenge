
class SessionController < Sinatra::Base
	enable :sessions
	set :session_secret, 'secret'
	register Sinatra::Flash
	
	get '/session/new' do
		erb :sign_in
	end

	delete '/session' do
		session[:user_id] = nil
		flash[:signed_out] = 'You are now signed out'
		redirect '/'
	end

	post '/session' do
		user = User.auth(params[:username], params[:password])
 		if user
 			session[:user_id] = user.id
			redirect '/account' 
		else
			flash[:failed] = "Invalid username or password"
			redirect '/session/new'
		end
	end

end
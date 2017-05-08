	
class UserController < Sinatra::Base	
	enable :sessions
	set :session_secret, 'secret'
	register Sinatra::Flash
	
	get '/users/new' do
		erb :sign_up
	end

	post '/users' do
		if User.first(username: params[:username])
			flash[:error] = "Username already in use"
			redirect '/users/new'
		elsif User.first(email: params[:email])
			flash[:error] = "Email already in use"
			redirect '/users/new'
		else
			user = User.create(
				name: params[:name], 
				email: params[:email], 
				username: params[:username], 
				password: params[:password])
			session[:user_id] = user.id
			redirect '/account'
		end
	end

end
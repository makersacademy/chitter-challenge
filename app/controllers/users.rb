class Chitter < Sinatra::Base
	
	get '/users' do
		erb :users
	end

	post '/users/new' do
		@user = User.create(name: params[:name],
											  email: params[:email],
											  username: params[:username],
											  password: params[:password],
											  password_confirmation: params[:password_confirmation])
		if @user.save
			session[:user_id] = @user.id 
			redirect '/message_board'
		else 
			flash.keep[:errors] = @user.errors.full_messages
			redirect '/users'
		end
	end
end
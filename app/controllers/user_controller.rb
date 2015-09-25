module App
	module Routes
		class User_Controller < Base

			get '/user/new' do
				@user = User.new
				erb :'/user/new'
			end

			post '/user' do
				@user = User.new(email: params[:email], username: params[:username], 
					password: params[:password], password_confirmation: params[:password_confirmation])
				if @user.save
					session[:user_id] = @user.id
					redirect to('/welcome')
				else
					flash.now[:errors] = @user.errors.full_messages
					erb :'/user/new'
				end
			end
		end
	end
end
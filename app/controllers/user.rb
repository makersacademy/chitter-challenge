class Chitter < Sinatra::Base

	get '/newuser' do
		@user = User.new
		erb(:'/user/new')
	end

	post '/user' do
		@user = User.create(email: params[:email], password: params[:password], username: params[:username])
		if @user.save
			session[:user_id] = @user.id
			redirect to('/peeps')
		else
			flash.now[:errors] = @user.errors.full_messages
			erb :'user/new'
		end
	end

	post '/registereduser' do
		@user = User.authenticate(params[:email], params[:password])
		if @user
			session[:user_id] = @user.id
			redirect to('/peeps')
		else
			flash[:errors] = ['Incorrect email or password']
			redirect to('/')
		end
	end

	delete '/user' do
		session.clear
		redirect to('/')
	end
end

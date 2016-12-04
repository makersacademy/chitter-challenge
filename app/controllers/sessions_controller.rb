class Chitter < Sinatra::Base

	get '/sessions/new' do
		erb :'sessions/new'
	end

	post '/sessions' do
		if @user = User.authenticate(params[:email], params[:password])
			session[:user_id] = @user.id
			redirect '/'
		else
			flash.now[:errors] = ['Email address or password is incorrect']
			erb :'sessions/new'
		end
	end

	delete '/sessions' do
		session[:user_id] = nil
		flash.keep[:notice] = 'See you again soon!'
		redirect to '/'
	end

end
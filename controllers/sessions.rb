class Chitter < Sinatra::Base

  get '/sessions/new' do
  	erb :'sessions/new'
  end

  post '/sessions' do
  	if current_user
  		flash[:errors] = ["Sorry, #{current_user.username} is already signed in"]
  		redirect '/peeps/index'
  	end
  	user = User.authenticate(params)
  	if user
  		session[:current_user_id] = user.id
  		redirect '/peeps/index'
  	else
  		flash[:errors] = ['Email address or password is incorrect']
  		redirect '/sessions/new'
  	end
  end

  delete '/sessions' do
  	flash[:notice] = "Goodbye #{current_user.username}"
  	session[:current_user_id] = nil
  	redirect '/peeps/index'
  end

end
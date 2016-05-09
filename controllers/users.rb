class Chitter < Sinatra::Base

	get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
 		new_user = User.new(params)
  	if new_user.save
			redirect '/sessions/new'
		else
			flash.now[:errors] = new_user.errors.full_messages
			erb :'users/new'
		end
  end

end
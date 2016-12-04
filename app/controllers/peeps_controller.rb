class Chitter < Sinatra::Base

	get '/peeps' do
		@peeps = Peep.all
		erb :'peeps/index'
	end

	get '/peeps/new' do
		erb :'peeps/new'
	end

	post '/peeps/add' do
		if !current_user
			flash.now[:errors] = ['You must be signed in to peep!']
			erb :'peeps/new'
		else @peep = Peep.create(firstname: current_user.firstname,
				surname: current_user.surname,
				username: current_user.username,
				text: params[:text])
			@peep.save
			redirect '/peeps'
		end
	end
end
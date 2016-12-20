class Chitter < Sinatra::Base

	get '/' do
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
		else @peep = Peep.create(text: params[:text], time: current_time, user_id: current_user.id)
			@peep.save
			redirect '/'
		end
	end
end
module App
	module Routes
		class Cheets_Controller < Base
			
			get '/cheets' do
				@cheets = Cheet.all
				erb :'/cheets/index'
			end

			get '/cheets/new' do
				erb :'/cheets/new'
			end

			post '/cheets' do
				cheet = Cheet.create(message: params[:message], time: DateTime.now, user_id: current_user.id)
				redirect to('/cheets')
			end
		end
	end
end

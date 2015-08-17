module App
	module Routes
		class Cheets_Controller < Base
			
			get '/cheets' do
				@user = User.new
				@cheets = Cheet.all
				erb :'/cheets/index'
			end

			get '/cheets/new' do
				erb :'/cheets/new'
			end

			post '/cheets' do
				@cheets = Cheet.new(message: params[:message], time: DateTime.now)
				@cheets.save
				redirect to('/cheets')
			end
		end
	end
end

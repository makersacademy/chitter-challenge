
class MessageController < Sinatra::Base
	enable :sessions
	set :session_secret, 'secret'
	register Sinatra::Flash
	
	post '/messages' do
		unless params[:message].empty?
			message = Message.create(
				text: params[:message], 
				date_time: Time.now,
				user_id: current_user.id)
			redirect '/'
		end
	end

	get 'messages/new' do
		if current_user
			erb :message_new
		else
			erb :sign_in
		end
	end

end
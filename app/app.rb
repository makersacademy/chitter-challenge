ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'server.rb'

class Chitter < Sinatra::Base

	enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def format_time(time) 
    	"#{time.day}/#{time.month}/#{time.year} - #{time.hour}:#{time.min}"
    end
  end


	get '/' do
		erb :index
	end

	get '/users' do
		erb :users
	end

	post '/users/new' do
		@user = User.create(name: params[:name],
											  email: params[:email],
											  username: params[:username],
											  password: params[:password],
											  password_confirmation: params[:password_confirmation])
		if @user.save
			session[:user_id] = @user.id 
			redirect '/message_board'
		else 
			flash.keep[:errors] = @user.errors.full_messages
			redirect '/users'
		end
	end

	post '/sessions' do
		user = User.authenticate(params[:email],params[:password])
		if user
			session[:user_id] = user.id
			redirect '/message_board'
		else
			flash.now[:errors] = ['The email or password is incorrect']
			erb :users
		end
	end

	post '/sessions/end' do
		session[:user_id] = nil
		redirect '/'
	end

	get '/message_board' do
		@messages = Message.last(10)
		erb :message_board
	end

	post '/message_board/new' do
		message = Message.create(time_created: format_time(Time.new),body: params[:message_body])
		message.user_id = current_user.id
		flash.keep[:errors] = message.errors.full_messages if !message.save
		message.save
		redirect '/message_board'
	end

end
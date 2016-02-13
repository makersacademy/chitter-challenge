ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
	enable :sessions
  register Sinatra::Flash


  get '/' do
    erb :index
  end

  post '/register' do 
  	user = User.create(first_name: params[:first_name], last_name: params[:last_name],
  		username: params[:username], email: params[:email], 
  		password: params[:password])
  	session[:user_id] = user.id
	  	 if user.saved?
	      session[:user_id] = user.id
	      redirect '/peeps'
	    else
	      flash.now[:errors] = user.errors.full_messages
	      erb :index
	    end
  end

  get '/peeps' do 
  	erb :peeps
  end

  helpers do
  	def current_user
  	@current_user ||= User.get(session[:user_id]) 
  	end
	end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

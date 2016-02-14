ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
	enable :sessions
	use Rack::MethodOverride
  register Sinatra::Flash


  get '/' do
    erb :index
  end

  post '/register' do 
  	@user = User.create(first_name: params[:first_name], last_name: params[:last_name],
  		username: params[:username], email: params[:email], 
  		password: params[:password], 
  		password_confirmation: params[:password_confirmation])

  	session[:user_id] = @user.id
	  	 if @user.saved?
	      session[:user_id] = @user.id
	      redirect to('/logged_in')
	    else
	      flash.now[:errors] = @user.errors.full_messages
	      erb :index
	    end
  end

  get '/login' do 
  	erb :login
  end

  post '/login' do 

		
		user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/logged_in')
    else
      flash.now[:errors] = ['The email or password is incorrect']
    end
  end

  get '/logged_in' do 
    @user=User.all
    @peeps = Peep.all 
  	erb :logged_in
 	end

  get '/peeps' do
    @peeps = Peep.all 
  	erb :peeps
  end

  post '/peeps' do 
  peep = Peep.new(content: params[:content], time: params[:time], 
  created_at: params[:created_at])
  peep.user = User.get(session[:user_id])
  peep.save
  redirect to('/logged_in')
  end


  delete '/log_out' do
   	session[:user_id] = nil
  	redirect '/peeps'
  end

	helpers do
		def current_user
			@current_user ||= User.get(session[:user_id]) 
		end
	end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'bcrypt'
require 'data_mapper'
require_relative './models/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base

	register Sinatra::Flash
	enable :sessions
	set :session_secret, 'super secret'
  
  get '/' do
  	redirect '/sign_up'
  end

  get '/sign_up' do
  	@user = User.new
    erb(:'users/sign_up')
  end

  post '/users' do
  	@user = User.create(email: params[:email],
                  name: params[:name],
                  nickname: params[:nickname],
  								password: params[:password],
  								password_confirmation: params[:password_confirmation])
  	if @user.save # #save returns true/false depending on whether the model is successfully saved to the database.
	    session[:user_id] = @user.user_id
	    redirect to('/peep')

  	else
			flash.now[:errors] = @user.errors.full_messages   		
			erb :'users/sign_up'
		end
  end

   get '/peep' do
   	erb :'peep/peep'
   end

  get '/sign_in' do
  	erb :'users/sign_in'
	end

	post '/sign_in' do
  user = User.authenticate(params[:email], params[:password])
	  if user
	    session[:user_id] = user.user_id
	    redirect to('/peep')
	  else
	    flash.now[:errors] = ['The email or password is incorrect']
	    erb :'users/sign_in'
	  end
	end

  helpers do
 	def current_user
   @current_user ||= User.get(session[:user_id])
  end
end

  run! if app_file == $0
end
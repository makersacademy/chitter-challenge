ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'bcrypt'
require 'data_mapper'
require_relative './models/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'
  
  get '/' do
  	redirect '/sign_up'
  end

  get '/sign_up' do
    erb(:'users/sign_up')
  end

  post '/users' do
  	user = User.create(email: params[:email],
                  name: params[:name],
                  nickname: params[:nickname],
  								password: params[:password],
  								password_confirmation: params[:password_confirmation])
  	#session[:user_id] = user.user_id
  	if user.save # #save returns true/false depending on whether the model is successfully saved to the database.
	    session[:user_id] = user.user_id
	    redirect to('/peep')
	    # if it's not valid,
	    # we'll render the sign up form again
  	else
   		erb :'users/sign_up'
  	end

  	#user.save
  	#erb :'users/sign_up'
  	#redirect '/peep'
  end

   get '/peep' do
   	erb :'peep/peep'
   end

  helpers do
 	def current_user
   @current_user ||= User.get(session[:user_id])
  end
end

  run! if app_file == $0
end
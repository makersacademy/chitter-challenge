ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'bcrypt'
require 'data_mapper'
require_relative './models/user'


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
  	@user = User.create(email: params[:email],
                  name: params[:name],
                  nickname: params[:nickname],
  								password: params[:password],
  								password_confirmation: params[:password_confirmation])
  	session[:user_id] = @user.user_id
  	@user.save
  	#erb :'users/sign_up'
  	redirect '/peep'
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
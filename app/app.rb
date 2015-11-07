require 'sinatra/base'
require 'bcrypt'
require 'data_mapper'
require_relative './models/user'


class Chitter < Sinatra::Base

	enable :sessions
  
  get '/' do
  	redirect '/sign_up'
  end

  get '/sign_up' do
    erb(:'users/sign_up')
  end

  post '/users' do
  	@user = User.new(email: params[:email],
                  password: params[:password])
  	#session[:user_id] = user.id
  	erb :'users/sign_up'
  	#redirect '/peep'
  end

  # get '/peep' do
  # 	@current_user = User.get(session[:user_id])
  # 	erb :'peep/peep'
  # end

  run! if app_file == $0
end
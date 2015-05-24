require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'
require_relative 'user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/user'
require './lib/peep' # this needs to be done after datamapper is initialised

DataMapper.finalize

DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

	use Rack::Flash
	use Rack::MethodOverride
	enable :sessions
	set :session_secret, 'extremely secret stuff'

	helpers do
		def current_user
			@current_user ||= User.get(session[:user_id]) if session[:user_id]
		end
	end

  get '/' do
  	@peeps = Peep.all
    erb :index
  end

  get '/users/new' do
  	@user = User.new
  	erb :'users/new'
  end

  post '/users' do
  	@user = User.create(email: params[:email],
  											password: params[:password],
  											password_confirmation: params[:password_confirmation])
  	if @user.save
  		session[:user_id] = @user.id




  		redirect '/'
  	else
  		flash.now[:errors] = @user.errors.full_messages
  		erb :'users/new'
  	end
  end

  get '/sessions/new' do
  	erb :'sessions/new'
  end

  post '/sessions' do
  	email, password = params[:email], params[:password]
  	@user = User.authenticate(email, password)
  	if @user
  	 	session[:user_id] = @user.id
      session[:name] = @user.name
      session[:username] = @user.username
  		redirect '/'
  	else
  		erb :'sessions/new'
  		flash[:errors] = ['The email or password is incorrect']
  	end
  end

  delete '/sessions' do
  	# INCLUDE FLASH NOTICE?
  	session[:user_id] = nil
  	redirect '/'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  post '/peeps' do
  	if current_user
  		Peep.create(peep_text: params['peep_text'],
      	          username: current_user.username,
        	        name: current_user.name)
    	redirect '/'
  	else
  		flash[:notice] = 'Please log in to peep!'
  		redirect '/sessions/new'
  	end
  end

  run! if app_file == $0

end

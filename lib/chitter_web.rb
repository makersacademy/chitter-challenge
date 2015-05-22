require 'sinatra/base'

require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/user' # this needs to be done after datamapper is initialised

DataMapper.finalize

DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
	enable :sessions
	set :session_secret, 'extremely secret stuff'

	helpers do
		def current_user
			@current_user ||= User.get(session[:user_id]) if session[:user_id]
		end
	end

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
  	@user = User.new
  	erb :'users/new'
  end

  post '/users' do
  	@user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  	session[:user_id] = @user.id
  	redirect '/'
  end

  run! if app_file == $0
end

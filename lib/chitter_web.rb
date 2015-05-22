require 'sinatra/base'
require 'tilt/erb'
require 'data_mapper'
require_relative 'user'

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
    @peeps = Peep.all
    erb :index
  end

  get '/users/new' do
  	@user = User.new
  	erb :'users/new'
  end

  post '/users' do
  	@user = User.create(email: params[:email], password: params[:password])
  	session[:user_id] = @user.id
  	redirect '/'
  end

  get '/sessions/new' do
  	erb :'sessions/new'
  end

  run! if app_file == $0
end

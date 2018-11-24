require 'sinatra/base'
require_relative 'lib/user.rb'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
	enable :sessions

	get '/' do
		@user = User.find(id: session[:user_id])
		erb(:'index')
	end

	get '/users/new' do
		erb(:'users/new')
	end

	# INICIO DE CRUD

	post '/users' do
		user = User.create(name: params['name'], u_name: params['u_name'], email: params['email'], password: params['password'])
		session[:user_id] = user.id
		redirect('/')
	end

	
run! if app_file == $0
end
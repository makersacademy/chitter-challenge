require 'sinatra/base'
require 'sinatra/reloader'

require './lib/peep'
require './lib/user'


class Chitter < Sinatra::Base
	enable :sessions

	configure :development do
    register Sinatra::Reloader
  end

	get "/" do
		# Ordinary home route
		"Welcome to Chitter App"
	end

	post '/peeps' do
		# This route creates the peep based on the form in `/peeps/new` and redirects it to `/peeps`
		Peep.create(peep: params[:message])
		redirect '/peeps'
	end

	get '/peeps/new' do
		# This route displays a form to be filled-in to create a new peep
		erb :'peeps/new'
	end

	get '/peeps' do
		# This route displays all the peeps in chronological order
		@user = User.get(id: session[:user_id])
		p @user
		@peeps = Peep.all
		erb :'peeps/index'
	end

	get "/users/new" do
		# Just like in peeps/new, this route displays a form to be filled-in to create a new user
		erb :'users/new'
	end

	post '/users' do
		# New user is created, based on the form in `users/new` route
		user = User.create(email: params[:email], password: params[:password])
		session[:user_id] = user.id
		redirect '/peeps'
	end


	run! if app_file == $PROGRAM_NAME
end
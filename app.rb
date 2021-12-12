require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'

require './lib/peep'
require './lib/user'
require './lib/database_connection'


class Chitter < Sinatra::Base
	enable :sessions

	configure :development do
    register Sinatra::Reloader
		register Sinatra::Flash
  end

	get "/" do
		# Ordinary home route
		erb :'sessions/new'
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
		# p @user
		@peeps = Peep.all
		erb :'peeps/index'
	end

	get "/signup" do
		# Just like in peeps/new, this route displays a form to be filled-in to create a new user
		erb :'users/signup'
	end

	post '/users' do
		# New user is created, based on the form in `users/new` route
		user = User.create(email: params[:email], password: params[:password])
		session[:user_id] = user.id
		redirect '/peeps'
	end

	get '/sessions/new' do
		erb :'sessions/new'
	end

	post '/sessions' do
		user = User.authenticate(email: params[:email], password: params[:password])
		if user 
			session[:user_id] = user.id
			redirect('/peeps')
		else 
			flash[:notice] = 'Please check your email or password.'
    	redirect('/sessions/new')
		end
	end

	post '/sessions/destroy' do
		session.clear
		flash[:notice] = 'You have signed out.'
		redirect('/')
	end

	run! if app_file == $PROGRAM_NAME
end
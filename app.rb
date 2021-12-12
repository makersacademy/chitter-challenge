require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'

require './lib/peep'
require './lib/user'
require './lib/database_connection'
require './lib/user_peep'


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
		if session[:user_id] != nil
			# This route creates the peep based on the form in `/peeps/new` and redirects it to `/peeps`
			new_post = Peep.create(peep: params[:message])
			UserPeep.create(user_id: session[:user_id], peep_id: new_post.id)
			redirect '/peeps'
		else
			redirect('/')
		end
	end

	get '/peeps' do

		@user = User.get(id: session[:user_id])

		if session[:user_id] != nil
			@peeps = UserPeep.view_all.reverse
			@peeps
		else
			redirect('/')
		end
		erb :'peeps/index'
	end

	get "/signup" do
		# Just like in peeps/new, this route displays a form to be filled-in to create a new user
		erb :'users/signup'
	end

	get '/sessions/new' do
		erb :'sessions/new'
	end

	post '/users' do
		# New user is created, based on the form in `users/new` route
		user = User.create(email: params[:email], password: params[:password])
		session[:user_id] = user.id
		redirect '/peeps'
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
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './models/datamapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

	use Rack::MethodOverride
	register Sinatra::Flash
	enable :sessions
	set :session_secret, 'super secret'

	def current_user
		#on sign-out current user should default back to nil
		if session[:current_user_id]
			@current_user ||= User.get(session[:current_user_id])
		else
			nil
		end
	end

  #user signup

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
 		new_user = User.new(params)
  	if new_user.save
			redirect '/sessions/new'
		else
			flash.now[:errors] = new_user.errors.full_messages
			erb :'users/new'
		end
  end

  #user signin

  get '/sessions/new' do
  	erb :'sessions/new'
  end

  post '/sessions' do
  	if current_user
  		flash[:errors] = ["Sorry, #{current_user.username} is already signed in"]
  		redirect '/peeps/index'
  	end
  	user = User.authenticate(params)
  	if user
  		session[:current_user_id] = user.id
  		redirect '/peeps/index'
  	else
  		flash[:errors] = ['Email address or password is incorrect']
  		redirect '/sessions/new'
  	end
  end

  #user signout

  delete '/sessions' do
  	flash[:notice] = "Goodbye #{current_user.username}"
  	session[:current_user_id] = nil
  	redirect '/peeps/index'
  end

  #peeps

  get '/peeps/index' do
    @peeps = Peep.all(:order => [:created_at.desc])
  	erb :'peeps/index'
  end

  post '/peeps' do    
    #peep belongs to user, but for some ungodly reason new_peep.user=current_user does not work
    #I get no errors in new_peep, it properly assigns the user_id, but its own id is nil
    new_peep = Peep.create(content: params[:content], created_at: Time.now, user_id: current_user.id)
    current_user.peeps << new_peep
    current_user.save
    redirect '/peeps/index'
  end

  run! if app_file == $0
end

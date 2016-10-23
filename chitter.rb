require 'sinatra/base'
require 'sinatra/flash'
ENV["RACK_ENV"] ||= 'development'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride

  set :sessions, true

  def current_user 
    @current_user ||= User.get(session[:user_id])
  end

	get '/' do
    @peeps = Peep.all(order: :created_on.desc)
		erb :index
	end

	get '/users/new' do
	  erb :signup
	end

  post '/users' do
  	user = User.new(email: params[:email], password: params[:password],
  		              password_confirmation: params[:password_confirmation])
  	if user.save
  	  flash.keep[:notice] = ["Sign Up Successful"]
      session[:user_id] = user.id
  	  redirect '/'
  	else 
  		flash.now[:notice] = user.errors.full_messages
  	  erb :signup
  	end
	end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      flash.keep[:notice] = ["You have successfully signed in as #{user.email}"]
      session[:user_id] = user.id
    else
      flash.keep[:notice] = ['The email or password is incorrect']
    end
    redirect '/'
  end

  delete '/sessions' do
    flash.keep[:notice] = ['You have successfully logged out']
    session[:user_id] = nil
    redirect '/'
  end

  get '/peeps/new' do
    erb :peep
  end

  post '/peeps' do
    if current_user 
      peep = Peep.new(content: params[:content])
      current_user.peeps << peep
      if current_user.save
        flash.keep[:notice] = ["You have successfully sent a peep"]
        redirect '/'
      else
       flash.now[:notice] = peep.errors.full_messages
       erb :peep
     end
    else
      flash.keep[:notice] = ["You need to log in to peep!"]
      redirect '/'
    end
  end

	run! if app_file == $0
end
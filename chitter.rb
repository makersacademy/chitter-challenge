require 'sinatra/base'
require 'sinatra/flash'
ENV["RACK_ENV"] ||= 'development'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  set :sessions, true
  use Rack::MethodOverride

  def current_user 
    @current_user ||= User.get(session[:user_id])
  end

	get '/' do
		erb :index
	end

	get '/users/new' do
	  erb :signup
	end

  post '/users' do
  	user = User.new(email: params[:email], password: params[:password],
  		              password_confirmation: params[:password_confirmation])
  	if user.save
  	  flash.now[:notice] = ["Sign Up Successful"]
      session[:user_id] = user.id
  	  erb :index
  	else 
  		flash.now[:notice] = user.errors.full_messages
  	  erb :signup
  	end
	end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      flash.now[:notice] = ["You have successfully signed in as #{user.email}"]
      session[:user_id] = user.id
      erb :index
    else
      flash.now[:notice] = ['The email or password is incorrect']
      erb :index
    end
  end

  delete '/sessions' do
    flash.now[:notice] = ['You have successfully logged out']
    session[:user_id] = nil
    erb :index
  end

	run! if app_file == $0
end
require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base

 	# set :views, proc { File.join(root, '.', 'views') }
 	set :views, Proc.new {File.join(root, '.', "views")}
  # set :public, proc { File.join(root, '.', 'public') }

	enable :sessions
	set :session_secret, 'super secret'
	register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
  	@user = User.new
  	erb :"users/new"
  	
  end

  post '/users' do
  	@user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
  	if @user.save
  			session[:user_id] = @user.id
 				redirect to("/")
  	else
  			flash.now[:errors] = @user.errors.full_messages
  			erb :"users/new"
  	end
  end

  helpers do
  	def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

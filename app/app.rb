ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  get '/users/new' do
  	erb(:'users/sign_up')
  end

  post '/users/new' do
  	@user = User.create(name: params[:name],
  							email: params[:email],
  							password: params[:password],
                password_confirmation: params[:password_confirmation])
    
    if @user.save
      session[:user_id] = @user.id
      redirect('/users')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/sign_up')
    end
  end

  get '/users' do
    erb(:'users/home')
	end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end



ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
# require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/flash'
require_relative 'models/user'


class Chitter_challenge < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
  end

  get '/home' do
    erb :home
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/signup' do
    @user = User.create(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect to ('/home')
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :signup
      end
  end



  # start the server if ruby file executed directly
  run! if app_file == $0

end

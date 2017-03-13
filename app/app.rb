ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/user/new' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    @user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save #save returns boolean value depending on if the user was saved into the database.
      session[:user_id] = @user.id
      redirect to ('/peeps')
    else
      flash.now[:notice] = "Passwords don't match."
      erb :sign_up
    end
  end

  get '/peeps' do
    'Peeps here!'
  end

  # creates a helper method that returns an instance of User for the currently logged-in user.
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end

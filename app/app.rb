ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require './app/models/user.rb'
require './app/datamapper_setup.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :sign_in
  end

  post '/' do
    @user = User.new(username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/logged_in')
    else
      flash.now[:notice] = "Your password and confirmation password do not match"
      erb :new_user
    end
  end

  get '/logged_in' do
    erb :logged_in
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

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
    erb :index
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
      flash.now[:errors] = @user.errors.full_messages
      erb :new_user
    end
  end

  get '/sign_up' do
    erb :sign_in
  end

  get '/logged_in' do
    erb :logged_in
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

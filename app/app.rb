ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'



class ChitterApp < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super_secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get "/" do
    erb :"sessions/new"
  end

  post "/sessions" do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to("/peeps")
    else
      flash.now[:errors] = ["The email or password is incorrect"]
      erb :"/sessions/new"
    end
  end

  get "/sessions/new" do
    erb :"/sessions/new"
  end

  get "/users/new" do
    @user = User.new
    erb :"users/new"
  end

  post "/users" do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to("/peeps")
    else
      flash.now[:notice] = ["Password and confirmation password do not match"]
      erb :"users/new"
    end
  end

  get "/peeps" do
    erb :peeps_list
  end

  delete "/sessions" do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to "/"
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

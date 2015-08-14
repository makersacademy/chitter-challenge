require 'sinatra/base'
require "sinatra/session"
require "sinatra/flash"
require_relative "../data_mapper_setup"

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, "super secret"
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :home
  end

  get "/users/new" do
    @user = User.new
    erb :sign_up
  end

  post "/users" do
    @user = User.new(
      name: params[:name],
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:username] = @user.username
      redirect "/"
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get "/sessions/new" do
    erb :sign_in
  end

  post "/sessions" do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:username] = user.username
      redirect "/"
    else
      flash.now[:errors] = ["Email or password is incorrect."]
      erb :sign_in
    end
  end

  delete "/sessions" do
    session[:username] = nil
    redirect "/"
  end

  helpers do
    def current_peeper
      User.first(:username => session[:username])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

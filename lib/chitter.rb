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
      session[:user_id] = @user.id
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
      session[:user_id] = user.id
      redirect "/"
    else
      flash.now[:errors] = ["Email or password is incorrect."]
      erb :sign_in
    end
  end

  delete "/sessions" do
    session[:user_id] = nil
    redirect "/"
  end

  post "/peeps/new" do
    Peep.create(content: params[:peep], 
                user_id: session[:user_id], 
                creation_time: Time.new)
    redirect "/"
  end

  helpers do
    def current_peeper
      User.get(session[:user_id])
    end
    def name_finder(user_id)
      User.get(user_id).name
    end
    def username_finder(user_id)
      User.get(user_id).username
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

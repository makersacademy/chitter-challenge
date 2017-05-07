ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  User.first_or_create(first_name: "Hendrik",
  last_name: "Geiger",
  email: "hg92@me.com",
  user_name: "hg92",
  password_digest: "123456")

  get "/" do
    erb(:home)
  end

  get "/sign_up" do
    erb(:sign_up)
  end

  post "/create_user" do
    @new_user = User.first_or_create(first_name: params[:new_first_name],
    last_name: params[:new_last_name],
    email: params[:new_email],
    user_name: params[:new_username],
    password_digest: params[:new_password])
    session[:current_user] = @new_user.id
    redirect to ("feed/:current_user")
  end

  post "/set_session" do
    @current_user = User.first(user_name: params[:username])
    session[:current_user] = @current_user.id
    redirect to ("/feed/:current_user")
  end

  get "/feed/:current_user" do
    @current_user = User.first(id: session[:current_user])
    erb(:user_feed)
  end

end

ENV["RACK_ENV"] = "dev"

require "sinatra/base"
require_relative "data_mapper_setup"

class Chitter < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride

  get "/" do
    erb(:index)
  end

  get "/user/new" do
    erb(:"user/new")
  end

  post "/user" do
    user = User.create(
      username: params[:username],
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirm: params[:password_confirm]
    )
    user.save
    session[:user_id] = user.id
    redirect to("/")
  end

  get "/user/login" do
    erb(:"session/new")
  end

  post "/session/new" do
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.id
      redirect("/")
    else
      redirect("/user/login")
    end
  end

  get "/user/logout" do
    erb(:"session/end")
  end

  delete "/session" do
    session[:user_id] = nil
    "Successfully logged out"
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end

ENV["RACK_ENV"] = "dev"

require "sinatra/base"
require_relative "data_mapper_setup"

class Chitter < Sinatra::Base
  enable :sessions

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
      email: params[:email]
    )
    user.save
    redirect to("/")
  end

  get "/user/login" do
    erb(:"session/new")
  end

  post "/session/new" do
    user = User.first(username: params[:username])
    
    if user
      session[:user_id] = user.id
      redirect("/")
    else
      redirect("/user/login")
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end

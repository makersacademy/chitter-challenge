ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require "sinatra/flash"
require_relative "models/user"
require_relative "data_mapper_setup"

class ChitterChallenge < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.create(name: params[:name], username: params[:username],
                       email: params[:email], password: params[:password])
    if user.id.nil?
      flash[:errors] = user.errors.full_messages
      redirect to "/users/new"
    else
      session[:user_id] = user.id
      redirect to "/peeps"
    end
  end

  get "/peeps" do
    erb :"peeps/index"
  end

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end

ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require_relative "datamapper_setup"
require 'bcrypt'

class ChitterApp < Sinatra::Base
  include BCrypt
  enable :sessions
  set :session_secret, "super_secret"

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get "/" do
    @peeps = Peep.all
    erb :index
  end

  get "/users/new" do
    @duplicate_user = params[:duplicate_user]
    erb :"users/new_user"
  end

  post "/users" do
    user = User.create(name: params[:name],
                        user_name: params[:user_name],
                        email: params[:email],
                        password: params[:password])
    if user.id.nil?
      redirect to "/users/new?duplicate_user=true"
    else
      session[:user_id] = user.id
      redirect to "/"
    end
  end

  get "/sessions/new" do
    @invalid_login = params[:invalid_login]
    erb :"sessions/new"
  end

  post "/sessions" do
    user = User.first(email: params[:email])
    stored_password_hash = Password.new(user.password_digest)
    if stored_password_hash == params[:password]
      session[:user_id] = user.id
      redirect to "/"
    else
      redirect to "/sessions/new?invalid_login=true"
    end
  end

  get "/peeps/new" do
    if current_user
      erb :"peeps/new_peep"
    else
      redirect to "/"
    end
  end

  post "/peeps" do
    @peep = Peep.create(message: params[:message], user: current_user)
    redirect to "/"
  end

  post "/sessions/logout" do
    session[:user_id] = nil
    redirect to "/"
  end

  run! if app_file == $0
end

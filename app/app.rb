ENV["RACK_ENV"] ||= "development"
require "sinatra/base"
require "sinatra/flash"
require_relative "data_mapper_setup"

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :sessions_secret, "secrets"

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get "/peeps/new" do
    erb(:peeps_new)
  end

  post "/peeps/post" do
    Peep.create(message: params[:message], user: current_user)
    redirect to("/peeps")
  end

  get "/peeps" do
    @peeps = Peep.all(order: :created_at.desc)
    erb(:peeps)
  end

  get "/users/new" do
    @user = User.new
    erb(:user_new)
  end

  post "/users" do
    @user = User.create(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to("/peeps")
    else
      flash.now[:notice] = "Invalid email, password and/or password confirmation"
      erb(:user_new)
    end
  end

  run! if app_file == $0

end

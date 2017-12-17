ENV["RACK_ENV"] ||= "development"
require "sinatra/base"
require_relative "data_mapper_setup"

class Chitter < Sinatra::Base

  enable :sessions
  set :sessions_secret, "secrets"

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get "/peeps/new" do
    erb(:new_peeps)
  end

  get "/peeps" do
    @peeps = Peep.all(order: :created_at.desc)
    erb(:peeps)
  end

  post "/peeps/post" do
    peep = Peep.create(message: params[:message], user: current_user)
    redirect to("/peeps")
  end

  get "/users/new" do
    erb(:users)
  end

  post "/users" do
    user = User.create(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password_digest: params[:password])
    session[:user_id] = user.id
    redirect to("/peeps")
  end

  run! if app_file == $0

end

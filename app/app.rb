ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret { SecureRandom.hex(20) }

  get "/peeps/new" do
    erb :'/peeps/new'
  end

  post "/peeps" do
    Peep.create(content: params[:peep],
                      time: Time.now)
    redirect to("/peeps")
  end

  get "/peeps" do
    @peeps = Peep.all(:order => [:time.desc])
    erb :'/peeps/index'
  end

  get "/users/new" do
    erb :'/users/new'
  end

  post "/users" do
    user = User.create(username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to("/peeps")
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end

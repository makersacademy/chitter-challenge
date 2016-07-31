ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'something'
  register Sinatra::Flash
  use Rack::MethodOverride

  get "/" do
    erb :"index"
  end

  get "/signup" do
    erb :"signup"
  end

  post "/user" do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to("/main")
    else
      flash.now[:notice] = "Invalid password or email!"
      erb :"/signin"
    end
  end

  get "/signin" do
    erb :"signin"
  end

  delete "/signout" do
    session[:user_id] = nil
    redirect to "/signin"
  end

  post "/user/new" do
    @user = User.create(user_name: params[:user_name],
                       name: params[:name],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation],
                       email: params[:email])

      if @user.save
        session[:user_id] = @user.id
        redirect to "/main"
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :"/signup"
      end
  end

  get "/main" do
    @user = User.get(session[:user_id])
    @peeps = Peep.all
    erb :"main"
  end

  post "/peep" do
    Peep.create(author: current_user.user_name,
                content: params[:peep_content], created: Time.now)
    redirect to "/main"
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
    def print_all_peeps

    end
  end

  run! if app_file == $0
end

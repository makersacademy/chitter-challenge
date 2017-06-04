ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  get "/" do
    @all_peeps = Peep.all
    @current_user = User.get(session[:current_user_id])
    erb :index
  end

  get "/new_peep" do
    @current_user = User.get(session[:current_user_id])
    redirect "/403_error" if @current_user.nil?
    erb :make_peep
  end

  post "/post_peep" do
    @current_user = User.get(session[:current_user_id])
    Peep.create(message: params[:peep], user_id: @current_user.id)
    redirect "/"
  end

  get "/register_user" do
    erb :registration
  end

  post "/register_user" do
    @user = User.create(name: params[:name],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation])
    if @user.save
      session[:current_user_id] = @user.id
      redirect "/"
    else
      flash.now[:notice] = "Your passwords do not match, please try again"
      erb :registration
    end
  end

  get "/403_error" do
    status 403
    erb :error_403
  end
end

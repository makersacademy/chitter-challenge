ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get "/" do
    @all_peeps = Peep.all
    @current_user = session[:current_user]
    erb :index
  end

  get "/new_peep" do
    @current_user = session[:current_user]
    redirect "/403_error" if @current_user.nil?
    erb :make_peep
  end

  post "/post_peep" do
    Peep.create(message: params[:peep], user_id: session[:current_user].id)
    redirect "/"
  end

  get "/register_user" do
    erb :registration
  end

  post "/register_user" do
    User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:current_user] = User.first(name: params[:name])
    redirect "/"
  end

  get "/403_error" do
    status 403
    erb :error_403
  end
end

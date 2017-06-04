ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get "/" do
    erb :index
  end

  get "/new_peep" do
    erb :make_peep
  end

  post "/post_peep" do
    Peep.create(message: params[:peep])
    redirect "/homepage"
  end

  get "/register_user" do
    erb :registration
  end

  post "/register_user" do
    User.create(name: params[:name], email: params[:email])
    session[:current_user] = User.first(name: params[:name])
    redirect "/homepage"
  end

  get "/homepage" do
    @all_peeps = Peep.all
    @current_user = session[:current_user]
    erb :homepage
  end

end

ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/new_peep" do
    erb :make_peep
  end

  post "/post_peep" do
    Peep.create(message: params[:peep])
    redirect "/peeps"
  end

  get "/peeps" do
    erb :view_peeps
  end

  get "/register_user" do
    erb :registration
  end

  post "/register_user" do
    User.create(name: params[:name], email: params[:email])
  end

end

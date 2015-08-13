require 'sinatra/base'
require_relative "../data_mapper_setup"

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  post "/users" do
    User.create(
      name: params[:name],
      email: params[:email],
      username: params[:username],
      password: params[:password])
    redirect "/"
  end

  get "/users/new" do
    erb :sign_up
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

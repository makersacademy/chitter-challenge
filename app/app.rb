ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get "/" do
    erb(:home)
  end

  get "/sign_up" do
    erb(:sign_up)
  end

  post "/create_user" do
    @new_user = User.first_or_create(first_name: params[:new_first_name],
    last_name: params[:new_last_name],
    email: params[:new_email],
    user_name: params[:new_username],
    password_digest: params[:new_password])
  end

end

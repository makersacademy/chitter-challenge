ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    @user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      "Welcome to Chitter, #{@user.name}"
    else
      redirect to('/users/new')
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

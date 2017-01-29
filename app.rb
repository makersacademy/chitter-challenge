ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/user.rb'

class Chitter < Sinatra::Base

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    email = params[:email]
    name = params[:name]
    user_name = params[:user_name]
    password = params[:password]
    user = User.create(email: email,
                        name: name,
                        user_name: user_name,
                        password: password)
    erb :sign_up
  end






  # start the server if ruby file executed directly
  run! if app_file == $0
end

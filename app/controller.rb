ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/sign-up' do
    erb :"sign-up"
  end

  post '/new_user_sign_up' do #Is this too verbose?
    name = params[:name]
    username = params[:username]
    password = params[:password]
    email =params[:email]
    new_user = User.new(name: name,
                        username: username,
                        password: password,
                        email: email)
    new_user.save
  end


end

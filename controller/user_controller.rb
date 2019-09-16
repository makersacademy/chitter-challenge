require_relative 'application_controller'
require_relative '../model/user.rb'

class UserController < ApplicationController

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    name = params[:name]
    email = params[:user_email]
    password = params[:password]
    user = User.create(:name => name, :email => email, :password => password)
    redirect '/'
  end

  get '/login' do
    erb :login
  end

end

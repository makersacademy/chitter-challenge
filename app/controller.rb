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

  post '/new_user_sign_up' do #Is new_user_sign_up too verbose?
    name = params[:name]
    username = params[:username]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    email =params[:email]

    new_user = User.new(name: name,
                        username: username,
                        password: password,
                        password_confirmation: password_confirmation,
                        email: email)

    if new_user.valid?
      new_user.save
      redirect('/feed')
    end
  end

  get '/feed' do
    erb :feed
  end


end

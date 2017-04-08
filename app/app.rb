ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/data_mapper_setup'


class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/signup'
  end

  post '/users' do
    User.create(first_name: params[:first_name],
            last_name: params[:last_name],
                  email: params[:email],
               username: params[:username],
               password: params[:password])
    redirect to '/peeps'
  end

  get '/peeps' do

  end
end

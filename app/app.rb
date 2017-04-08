ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/data_mapper_setup'


class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.new(first_name: params[:first_name],
            last_name: params[:last_name],
                  email: params[:email],
               username: params[:username],
               password: params[:password],
               password_confirmation: params[:password_confirmation])
    if user.save
      redirect to '/peeps'
    else
      flash.now[:error] = user.errors.full_messages
      erb :'users/signup'
    end
  end

  get '/peeps' do

  end
end

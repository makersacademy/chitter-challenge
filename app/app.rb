ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'


class Chitter < Sinatra::Base
  register Sinatra::Flash

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
      flash.now[:errors] = user.errors.full_messages
      erb :'users/signup'
    end
  end

  get '/sessions/new' do
    erb :'sessions/login'
  end

  post '/sessions' do
    redirect to '/peeps'
  end

  get '/peeps' do
  end
end

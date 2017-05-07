ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/index'
  end

  get '/index' do
    erb :'index'
  end

  get '/new_user' do
    erb :'new'
  end

  post '/users' do
    User.create(email: params[:email],
                password: params[:password])
    redirect to '/index'
  end

end

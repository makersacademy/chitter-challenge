ENV['RACK_ENV'] ||='development'

require 'sinatra/base'
require 'pry'
require_relative './models/data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/sign_up' do
    erb :sign_up
  end

  post '/sign_up/complete' do
    User.create(name: params[:name], user_name: params[:user_name], email: params[:email], password: params[:password])
    redirect '/'
  end

end

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/users/new' do
    erb :signup
  end

  post '/users/new' do
    p user = User.create(name: params[:name], username: params[:username], email: params[:email],
            password: params[:password])
    redirect('/session')
  end

  get '/session' do
    erb :session
  end


end

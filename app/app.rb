require 'sinatra/base'
#require_relative 'data_mapper_setup'
require './app/models/user'


class Chitter < Sinatra::Base

  get '/' do
    erb :'index'
  end

  get '/signup' do
    erb :'sign_up'
  end

  post '/registration' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       name: params[:name],
                       username: params[:username])
    redirect '/'
  end


end

Chitter.run! if $0 == 'app/app.rb'

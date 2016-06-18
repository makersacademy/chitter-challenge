require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/user'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name],
                email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

require 'sinatra/base'
require 'bcrypt'
require 'data_mapper'
require_relative './models/user'


class Chitter < Sinatra::Base
  
  get '/' do
  	redirect '/sign_up'
  end

  get '/sign_up' do
    #@user = User.new
    erb(:'users/sign_up')
  end

  post '/users' do
  	@user = User.new(email: params[:email],
                  password: params[:password])
  	erb :'users/sign_up'
  end

  run! if app_file == $0
end
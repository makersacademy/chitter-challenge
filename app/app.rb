ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/users/sign_up' do
  	erb(:'users/sign_up')
  end

  post '/users/sign_up' do
  	User.create(name: params[:name],
  							email: params[:email],
  							password: params[:password])
  	redirect('/users/welcome')
  end

  get '/users/welcome' do
	end

  run! if app_file == $0
end

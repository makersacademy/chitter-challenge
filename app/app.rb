require 'sinatra/base'
require './app/data_mapper_setup'
require './app/models/user'
require 'bcrypt'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/register_user' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect to '/'
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end

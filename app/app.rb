ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  get '/home' do
    "Hello"
  end

  get '/sign_up' do
      erb :sign_up
    end

  post '/users' do
    @user = User.create(name: params[:name],
                    email: params[:email],
                    username: params[:username],
                    password: params[:password])
    redirect '/home'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello Chitter!'
  end

  get '/users/signup' do

    erb :'users/signup'
  end

  post '/users/signup' do

    Users.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

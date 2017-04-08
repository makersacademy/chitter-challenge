# ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
# require_relative 'data_mapper_setup'
# require 'sinatra/flash'

class Kitter < Sinatra::Base
  enable :sessions
  # set :session_secret, 'super secret'
  # register Sinatra::Flash
  #
  # helpers do
  #   def current_user
  #     @current_user ||= User.get(session[:user_id])
  #   end
  # end

  get '/users/new' do
    erb :'users/new'
  end

  run! if app_file == $0
end

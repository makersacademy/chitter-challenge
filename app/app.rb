ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/data_mapper_setup'
require_relative 'server'
require_relative 'register'
require_relative 'peeps'
require_relative 'sessions'

 class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  # get '/sessions/new' do
  #   erb :'sessions/new'
  # end
  #
  # post '/sessions' do
  #   user = User.authenticate(params[:email], params[:password])
  #     if user
  #       session[:user_id] = user.id
  #       redirect to ('/peeps')
  #     else
  #       flash.now[:errors] = ['The email or password is incorrect']
  #       erb :'sessions/new'
  #     end
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

 ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/feed' do
    erb :feed
  end

  get '/create_account' do
    erb :create_account
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

require 'sinatra/base'

ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end

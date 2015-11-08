ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  get '/' do
    redirect('/index')
  end

  get '/index' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

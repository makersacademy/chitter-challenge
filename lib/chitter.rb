ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  

  # start the server if ruby file executed directly
  run! if app_file == $0
end

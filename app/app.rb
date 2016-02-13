require 'sinatra/base'
require 'sinatra/flash'
require 'rest_client'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end






  # start the server if ruby file executed directly
  run! if app_file == $0
end

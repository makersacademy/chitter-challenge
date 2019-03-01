require 'sinatra/base'

class Chitter < Sinatra::Base


  get '/' do
    "Welcome to Chitter!!!"
  
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
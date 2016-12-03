require 'sinatra/base'

class Twitter < Sinatra::Base
  get '/' do
    'Hello Twitter!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

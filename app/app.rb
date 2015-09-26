require 'sinatra/base'

class ChitterApp < Sinatra::Base

  get '/' do
    'Hello ChitterApp!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

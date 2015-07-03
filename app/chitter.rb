require 'sinatra/base'

class CHITTERchallenge < Sinatra::Base
  get '/' do
    'Hello CHITTERchallenge!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

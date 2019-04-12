require 'sinatra/base'
class Chitter < Sinatra::Base

  get '/' do
    'Test'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

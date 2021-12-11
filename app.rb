require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
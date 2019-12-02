require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  get '/' do
    "Welcome to the Chitter homepage"
  end
  # start the server if the ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

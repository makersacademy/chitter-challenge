require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Testing infrastructure working!"
  end

  run! if app_file == $PROGRAM_NAME
end

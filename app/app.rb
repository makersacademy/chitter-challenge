require 'sinatra/base'

class ChitterWebApp < Sinatra::Base
  get '/' do
    'Hello ChitterWebApp!'
  end

  run! if app_file == $PROGRAM_NAME
end

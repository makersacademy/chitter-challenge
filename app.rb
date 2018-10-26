require 'sinatra/base'

class ChipperManager < Sinatra::Base
  get '/' do
    'Chipper'
  end

  run! if app_file == $0
end

require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Displaying Messages'
  end

  run! if app_file == $0
end

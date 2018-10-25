require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter App'
  end

  run! if app_file == $0

end

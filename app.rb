require 'sinatra/base'
require 'sinatra/reloader'

class ChitterWeb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  run! if app_file == $0
end

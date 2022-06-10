require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChat < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello Hafiz'
  end

  run! if app_file == $0
end
require 'sinatra/base'
require 'sinatra/reloader'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello Chitter!'
  end

  run! if app_file == $0
end
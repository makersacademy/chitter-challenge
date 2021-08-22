require 'sinatra/base'
require 'sinatra/reloader'

class Zwitscher < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # erb :index
    'Hello world'
  end

  run! if app_file == $0
end

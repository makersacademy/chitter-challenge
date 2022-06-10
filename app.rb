require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :develpment do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello world'
  end

  run if app_file == $0
end

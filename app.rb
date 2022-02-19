require 'sinatra/base'
require 'sinatra/reloader'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Welcome to Chitter"
  end
  
  run! if app_file == $0
end

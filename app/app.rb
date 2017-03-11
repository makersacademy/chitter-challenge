require 'sinatra/base'

class App < Sinatra::Base

  run! if app_file == $0
end

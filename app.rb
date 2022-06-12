require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::base
  configure :development do
    register Sinatra::reloader
  end

  get ('/')
    'Hello World'
  end



  run! if app_file == $0
end
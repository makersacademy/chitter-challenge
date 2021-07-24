require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base
  get '/' do
    'Hello, World!'
  end
  
  run! if app_file == $0
end

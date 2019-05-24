require 'sinatra/base'

class ChitterChallenge < Sinatra::Base
  get '/' do
    "Hello!"
  end

  run! if app_file == $0
end

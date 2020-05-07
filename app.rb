require 'sinatra/base'

class Peep < Sinatra::Base
  get '/' do
    "hello world"
  end

  run! if app_file == $0
end
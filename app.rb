require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Hello Tunji!'
  end

  run! if app_file == $0
end


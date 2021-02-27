require 'sinatra/base'
# require './lib/Cheet'

class Chitter < Sinatra::Base

  get '/' do
    "Hello world"
  end

run! if app_file == $0

end

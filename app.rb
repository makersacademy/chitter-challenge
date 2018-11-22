require 'sinatra/base'
require 'peep'

class Chitter < Sinatra::Base

  get '/' do
    "Danusia.x: Hello Chitter!"
  end

  run! if app_file == $0
end

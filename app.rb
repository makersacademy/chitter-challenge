require 'sinatra/base'

class ChitterApp < Sinatra::Base

  get '/' do
    "My first peep."
  end

  run! if app_file == $0
end
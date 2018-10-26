require 'sinatra/base'
#require './lib/peep'

class Peep < Sinatra::Base

  get '/' do
    "Hello Peep"
  end

  run! if app_file == $0
end

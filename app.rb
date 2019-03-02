require 'sinatra/base'
# require './lib/class'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter!"
  end

  run! if app_file == $0
end

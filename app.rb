require 'sinatra/base'

class Warble < Sinatra::Base

  get '/' do
    'Home'
  end

  run! if app_file == $0

end

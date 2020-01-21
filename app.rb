require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'This is a Chitter challenge'
  end

  run! if app_file == $0
end

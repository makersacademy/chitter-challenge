require 'sinatra/base'

class Chitter < Sinatra::Base
  
  get '/' do
    'CHITTER'
  end

  run! if app_file == $0
end
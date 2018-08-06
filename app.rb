require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'I am here'
  end
  
  run! if app_file == $0
end

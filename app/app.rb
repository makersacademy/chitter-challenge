require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Test peep'
  end
  
  run! if app_file == $0
end

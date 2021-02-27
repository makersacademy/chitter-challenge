require 'sinatra/base'

class ChitterManager < Sinatra::Base
  get '/' do
    "Welcome to Chitter!"
  end

  run! if app_file == $0

end 

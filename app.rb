require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do  
    "Hello world from the homepage."
  end

  run! if app_file == $0
end

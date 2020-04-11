require 'sinatra/base'

class Chitter < Sinatra::base
  
  get '/' do
    "Hello World"
  end

end
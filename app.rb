require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Hello World"
  end

end
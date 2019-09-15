require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Application

  get '/' do
    "Hello World"
  end

end

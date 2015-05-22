require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Hello world!'
  end
end
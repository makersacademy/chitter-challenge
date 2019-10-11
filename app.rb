require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    'Hello world!'
  end

end
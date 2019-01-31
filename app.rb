require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    'hello chitter'
  end
end

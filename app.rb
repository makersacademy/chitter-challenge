require 'sinatra'

class Chitter < Sinatra::Base
  get '/' do
    'hello'
  end
end

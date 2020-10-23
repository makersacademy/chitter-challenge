require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    "hello world"
  end
end
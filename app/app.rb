require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Hello'
  end
end

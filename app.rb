require 'sinatra/base'

class Honker < Sinatra::Base

  get '/' do
    'Test infrastructure working.'
  end
end

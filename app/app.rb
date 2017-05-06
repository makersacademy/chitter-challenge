require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Testing infrastructure working.'
  end

end

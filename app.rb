require "./lib/chitter"
require 'sinatra/base'

class ChitterManager < Sinatra::Base

  get '/' do
    'hi'
  end
end

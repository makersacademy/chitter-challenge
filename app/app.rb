require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome'
  end
end

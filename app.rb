require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'homepage'
  end
end
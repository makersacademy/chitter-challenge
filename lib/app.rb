require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :layout
  end
end

require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :chitter_feed
  end
end

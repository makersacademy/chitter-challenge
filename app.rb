require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

end

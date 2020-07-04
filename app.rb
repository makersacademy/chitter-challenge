require 'sinatra/base'
require './lib/chitter'
class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

end

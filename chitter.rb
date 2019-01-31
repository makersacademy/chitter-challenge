require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

end

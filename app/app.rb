require 'sinatra/base'

class ChitterChatter < Sinatra::Base
  get '/' do
    erb :index
  end

end

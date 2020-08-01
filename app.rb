require 'sinatra/base'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end

end

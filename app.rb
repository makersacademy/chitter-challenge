require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter'
    erb(:index)
  end

end

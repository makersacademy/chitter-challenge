require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

end

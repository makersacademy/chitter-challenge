require 'sinatra'

class Chitterapp < Sinatra::Base

  get '/' do
    erb:index
  end

end
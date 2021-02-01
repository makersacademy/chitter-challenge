require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

end

require 'sinatra/base'

class Chitter < Sinatra::Base
  get "/" do
    "Hello Chitter"
  end
end

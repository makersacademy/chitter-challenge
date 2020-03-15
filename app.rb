require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "This is Chitter, your instant message service!"
  end
end

require 'sinatra/base'

class Chitter < Sinatra::Base
  
  get '/' do
    'Home'
  end

end

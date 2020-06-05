require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'hey yo its the weekend!'
  end

end

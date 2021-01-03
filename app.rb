require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'good morning'
  end

end

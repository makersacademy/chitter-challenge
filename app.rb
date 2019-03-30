require 'sinatra/base'

# Chitter class
class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

end
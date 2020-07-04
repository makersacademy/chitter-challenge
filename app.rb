require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello world"
  end
  
end
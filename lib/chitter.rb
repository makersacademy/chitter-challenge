require 'sinatra/base'

class Chitter < Sinatra::Application
  set :sessions, true

  get '/' do
    "Hello world"
  end
end

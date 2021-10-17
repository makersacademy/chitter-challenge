require 'pg' # remove this later
require 'sinatra/base'
require 'sinatra/reloader'
#require 'sinatra/flash'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end
end

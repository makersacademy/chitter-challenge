require 'sinatra/base'
# require './lib/bookmark'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end
end

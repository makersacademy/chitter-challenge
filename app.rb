require 'sinatra/base'
require 'sinatra'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end
end

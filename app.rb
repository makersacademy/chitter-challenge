require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb :'index'
  end
end
require 'sinatra/base'
require_relative '../lib/peep'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

end

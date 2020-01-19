require 'sinatra/base'
require './lib/models/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  run! if app_file == $0
end

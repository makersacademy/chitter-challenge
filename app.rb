require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base 

  get '/' do
    @cheeps = Cheep.all
    erb :index
  end

  run! if app_file == $0

end
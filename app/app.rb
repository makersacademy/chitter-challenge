require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Howdy'
    erb :index
  end

  run! if app_file == $0
end

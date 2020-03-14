require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter'

    erb :index
  end

  run! if app_file == $0
end

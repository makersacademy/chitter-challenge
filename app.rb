require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Peeps'
  end

  run! if app_file == $0
end

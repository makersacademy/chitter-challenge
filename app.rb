require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Testing infrastructure'
  end

  run! if app_file == $0
end

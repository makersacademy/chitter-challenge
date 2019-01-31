require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter away'
  end

  run! if app_file == $0
end

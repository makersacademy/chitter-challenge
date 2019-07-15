require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'peep'
  end

  run! if app_file == $0

end

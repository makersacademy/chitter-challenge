require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Testing, 1, 2, 3...is this mic on?'
  end

  run! if app_file == $0
end

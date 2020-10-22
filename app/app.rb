require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    "Hey!"
  end

  run! if app_file == $0
end

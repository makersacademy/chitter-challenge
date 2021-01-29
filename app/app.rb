require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Chitter!!"
  end

  # establish server if file run directly
  run! if app_file == $0
end

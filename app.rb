require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Testing Infrastructure"
  end

  run! if app_file == $0

end

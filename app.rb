require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :peeps
  end

  run! if app_file == $0

end

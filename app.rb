require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    'hello'
  end

  run! if app_file == $0

end

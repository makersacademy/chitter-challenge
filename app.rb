require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base 
  enable :sessions
  register Sinatra::Flash

  get '/' do
    "Chitter App"
  end

  run! if app_file == $0
end

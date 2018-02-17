require 'sinatra/base'
require 'net/http'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    "Hello World"
    erb :index
  end

  run! if app_file == $0
end

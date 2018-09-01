require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  run! if app_file == $0
end

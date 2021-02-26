require 'Sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  get '/' do
    "Welcome to Chitter! The whole world's at your finger[chits]!"
  end
  run! if app_file == Chitter
end

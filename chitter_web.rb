require 'sinatra/base'
require 'pg'

class ChitterWeb < Sinatra::Base

  run! if app_file == $0
end

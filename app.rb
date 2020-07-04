require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
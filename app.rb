require 'pg'
require 'sinatra/base'

class ChitterChatter < Sinatra::Base

  get "/" do
    erb :index
  end

  run! if app_file == $0

end

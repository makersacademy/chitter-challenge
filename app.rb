require 'sinatra/base'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :homepage
  end

  run! if app_file == $0
end

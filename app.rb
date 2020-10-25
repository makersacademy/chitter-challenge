require 'sinatra/base'

class ChitterApp < Sinatra::Base 

  get '/' do
    index :erb
  end

  run! if app_file == $0
end

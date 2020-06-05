require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end
 
  run! if app_file == $PROGRAM_NAME

end

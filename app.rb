require 'sinatra/base'

# Acts as the controller
class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end

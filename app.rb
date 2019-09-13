require 'sinatra/base'

class Chitter < Sinatra::Base

  run if app_file == $PROGRAM_NAME
end

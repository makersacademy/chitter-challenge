require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'You arrived at the homepage'
  end

  run! if app_file == $PROGRAM_NAME
end

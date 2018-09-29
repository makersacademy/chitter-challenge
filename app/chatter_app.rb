require 'sinatra/base'

class Chatter < Sinatra::Base

  get '/' do
    'Welcome to Chatter!'
  end

  run! if app_file == $PROGRAM_NAME
end
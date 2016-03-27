require 'sinatra/base'

class chitter < Sinatra::Base
  get '/' do
    'Hello chitter!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

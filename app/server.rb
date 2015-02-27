require 'sinatra/base'

class chitter_challenge < Sinatra::Base
  get '/' do
    'Hello chitter_challenge!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

require 'sinatra/base'

class ChitterChallenge < Sinatra::Application
  enable :sessions, :method_override

  get '/' do
    'Welcome to Chitter!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

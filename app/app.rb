ENV['ENV_RACK'] ||= 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base

  # server
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello MyApp!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

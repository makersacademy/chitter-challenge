require_relative 'helpers'

class App < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :sessions_secret, "This is really secret"
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers Helpers

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

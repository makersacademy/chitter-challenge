class Chitter < Sinatra::Base

  require_relative 'helpers'

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers Helpers

  # start the server if ruby file executed directly
  run! if app_file == $0

end

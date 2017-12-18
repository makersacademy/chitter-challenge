class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  use Rack::MethodOverride
  require_relative 'helpers'

  enable :partial_underscores

  run! if app_file == $0

end

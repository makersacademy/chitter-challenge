class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  require_relative 'helpers'

  enable :partial_underscores

  helpers Helpers

end

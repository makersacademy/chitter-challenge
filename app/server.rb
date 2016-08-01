require_relative 'helpers'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  helpers Helpers
  set :partial_template_engine, :erb
  enable :partial_underscores
end

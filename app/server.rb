class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  use Rack::MethodOverride
  enable :partial_underscores

  helpers ViewHelper
end

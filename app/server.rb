class Chitter < Sinatra::Base
  enable :sessions
  enable :partial_underscores
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
end

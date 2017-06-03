class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'chitter'
  set :partial_template_engine, :erb

  enable :partial_underscores

end

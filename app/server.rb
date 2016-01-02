class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'awesomesecret'
  set :partial_template_engine, :erb
  enable :partial_underscores
  helpers Helpers
end

class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::Session::Cookie, key: 'rack.session', secret: 'super secret'
  use Rack::MethodOverride
  set :partial_template_engine, :erb
  enable :partial_underscores
end

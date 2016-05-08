class Chitter < Sinatra::Base
  register Sinatra::Partial
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers Helpers

  set :partial_template_engine, :erb
  enable :sessions
  enable :partial_underscores
end

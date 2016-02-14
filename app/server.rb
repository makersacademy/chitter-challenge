class Chitter < Sinatra::Base
  helpers Helpers
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  set :partial_template_engine, :erb

  enable :partial_underscores

  run! if app_file == $0
end

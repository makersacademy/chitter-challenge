class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'

  register Sinatra::Flash
  
  use Rack::MethodOverride
  helpers Helpers

  run! if app_file == $0
end

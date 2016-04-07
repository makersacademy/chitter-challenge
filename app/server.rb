class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :public_folder, 'public'
  helpers Helpers

  enable :partial_underscores

  # start the server if ruby file executed directly
  run! if app_file == $0

end

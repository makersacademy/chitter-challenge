class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial

  use Rack::MethodOverride

  enable :sessions
  enable :partial_underscores

  set :session_secret, "secret message"
  set :partial_template_engine, :erb
  set :views, Proc.new { File.join(root, "../views") }

  helpers Helpers

  # start the server if ruby file executed directly
  run! if app_file == $0
end

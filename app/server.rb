require_relative 'helpers'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  set :public_folder, Proc.new { File.join(root, 'static') }

  enable :partial_underscores

  helpers Helpers

  # start the server if ruby file executed directly
  run! if app_file == $0
end

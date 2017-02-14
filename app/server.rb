require_relative 'helpers'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :root, File.dirname(__FILE__)

  helpers Helpers

  # start the server if ruby file executed directly
  run! if app_file == $0
end

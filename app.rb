require 'sinatra/base'
require 'sinatra/activerecord'
require './environments'

# Global for verbose output
# $verbose = true

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

  before '/' do
    verbose_output(request.url) if $verbose
  end

  get '/' do
    "<h1>Welcome to Chitter!</h1>"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  private

  # :nocov:
  def verbose_output(where)
    puts "\nin:\n#{where}"
    puts "session: "; p session
    puts "params: "; p params
  end
  # :nocov:

end

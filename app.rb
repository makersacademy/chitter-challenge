require 'sinatra/base'
require 'sinatra/activerecord'
require './environments'

# Global for verbose output
# $verbose = true

class Chitter < Sinatra::Base

  before '/' do
    verbose_output(request.url) if $verbose

  end

  get '/' do
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  private

  # :nocov:
  def verbose_output(where)
    puts "\n#{where}"
    puts "session: "; p session
    puts "params: "; p params
  end
  # :nocov:

end

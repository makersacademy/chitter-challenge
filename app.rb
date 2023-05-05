require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This refreshes the app code without having to restart the server with each change
  configure :development do
    register Sinatra::Reloader
  end
end
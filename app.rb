require 'pg'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567, rackup -p 4567

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  run! if app_file == $PROGRAM_NAME
end

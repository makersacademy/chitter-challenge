require 'sinatra/base'
require 'sinatra/reloader'
#require './lib/bookmarks'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  
  get '/' do
    "Welcome to chitter"
  end

  run! if app_file == $0
end
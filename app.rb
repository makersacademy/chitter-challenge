require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require_relative './lib/bookmark'

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    'Bookmark Manager'
  end

  run! if app_file == $0
end
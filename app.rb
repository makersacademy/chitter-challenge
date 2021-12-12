require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Chitter"
  end
end
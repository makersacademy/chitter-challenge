require 'sinatra/base'
require 'sinatra/reloader'
require 'capybara'
# require './lib/bookmarks'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end



  run! if app_file == $0
end


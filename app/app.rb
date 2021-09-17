require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/chitter'

class ChitterApp < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "yeee"
  end

  run! if app_file == $0
end
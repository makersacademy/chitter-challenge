require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Welcome to Chitter"
  end

  run! if app_file == $PROGRAM_NAME

end
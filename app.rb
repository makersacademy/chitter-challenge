# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/quack'

# DuckBoard class is the controller
class DuckBoard < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @quacks = Quack.all
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end

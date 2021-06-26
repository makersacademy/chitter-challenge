# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

# :nodoc:
class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome.'
  end

  run! if app_file == $0
end

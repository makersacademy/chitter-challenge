require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'

class ChitterApplication < Sinatra::Base
  # register Sinatra::ActiveRecordExtension
  # register Sinatra::Reloader

  configure :development do
    register Sinatra::Reloader
    register Sinatra::ActiveRecordExtension
  end
end
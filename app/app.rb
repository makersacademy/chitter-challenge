
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  # TODO: set stronger session key before deploying on Heroku.

end
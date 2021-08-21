require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
end 
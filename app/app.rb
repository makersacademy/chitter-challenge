ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'app_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end
end

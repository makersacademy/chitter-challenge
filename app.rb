ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require './config/datamapper'

class Chitter < Sinatra::Base
  set :method_override, true
  enable :sessions

  get '/' do
    "Welcome to Chitter"
  end
end

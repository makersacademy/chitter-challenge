ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:homepage)
  end
end

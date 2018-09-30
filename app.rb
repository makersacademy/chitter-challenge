require 'sinatra/base'
require 'data_mapper'
require './lib/models'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

  run! if app_file == $0
end

require 'sinatra/base'
require './spec/setup_database_test'

class ChitterManager < Sinatra::Base

  get '/' do
    'Hello World'
  end

  run! if app_file == $0
end

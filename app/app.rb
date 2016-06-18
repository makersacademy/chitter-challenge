ENV['RACK_ENV'] = 'dev'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    "Homepage"
  end

  run! if app_file == $0
end

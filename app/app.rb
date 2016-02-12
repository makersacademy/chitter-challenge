ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/user'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

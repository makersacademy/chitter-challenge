require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './lib/peep.rb'

DataMapper.finalize

DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

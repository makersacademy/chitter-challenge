require 'sinatra/base'
require 'data_mapper'
require_relative 'models/peep'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end


end

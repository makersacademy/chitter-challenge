require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

class Chitter < Sinatra::Base

  get '/' do
    'Alright Son?'
  end
end

DataMapper.finalize
DataMapper.auto_upgrade!

require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_app_#{env}")

require './app/models/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end
end

DataMapper.finalize
DataMapper.auto_upgrade!

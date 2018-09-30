require 'data_mapper'
require 'pry'

require_relative 'lib/peep.rb'

def setup_databases(env = 'development')

  # env = ENV['RACK_ENV'] || 'development'
  # binding.pry

  #DataMapper::Logger.new($stdout, :debug)

  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")


  DataMapper.finalize

  DataMapper.auto_upgrade!
end

require 'data_mapper'
require_relative 'models/user'
require_relative 'models/peep'

module DataMapperSetup
  def data_mapper_setup
    DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end
end

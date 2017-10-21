require 'data_mapper'
require 'dm-postgres-adapter'

module Database
  def self.connect
    DataMapper.setup(:default,  ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end
end
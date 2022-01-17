require 'active_record'

class DatabaseConnection
  def self.setup(database)
    ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: database
  )
  end
end

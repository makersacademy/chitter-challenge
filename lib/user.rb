require_relative './database_connection'

class User

  def self.setup(db_connect = DatabaseConnection)
    @con = db_connect
  end

end

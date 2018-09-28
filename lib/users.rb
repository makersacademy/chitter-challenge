require_relative 'database_connection'

class Users

  def initialize(connection: DatabaseConnection.new)
    @connection = connection
  end

  def create
  end

  def all
  end

  def update
  end

  def delete
  end
end

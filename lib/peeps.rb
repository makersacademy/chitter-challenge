require_relative 'database_connection'

class Peeps
  attr_reader :id, :user_handle, :peep

  def initialize(id, user_handle, peep)
    @id = id
    @user_handle = user_handle
    @peep = peep
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| Peeps.new(peep['id'], peep['user_handle'], peep['peep']) }
  end

  def self.post(new_peep)
    DatabaseConnection.query("INSERT INTO peeps (user_handle, peep) VALUES ('SherlockH', '#{new_peep}');")
  end
end

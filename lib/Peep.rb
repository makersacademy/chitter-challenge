require 'pg'
require 'database_connection'

class Peep

  def self.list
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      {:id => peep['id'], :message => peep['message']}
    end
  end
end

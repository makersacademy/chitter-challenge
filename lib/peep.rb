require "./lib/select_database"
require "./lib/database_connection"

class Peep 

  attr_reader :id, :body, :posted_at

  def initialize(id, body, date)
    @id = id
    @body = body
    @posted_at = date
  end

  def self.all
    select_database

    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")

    peeps.map do |peep|
      Peep.new(peep["id"], peep["body"], peep["posted_at"])
    end
  end

  def self.add(peep)
    select_database

    result = DatabaseConnection.query(
                              "INSERT INTO peeps (body) 
                              VALUES ('#{peep}') 
                              RETURNING id, body, posted_at;"
                            )
    Peep.new(result[0]["id"], result[0]["body"], result[0]["posted_at"])
  end

end

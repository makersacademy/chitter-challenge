require "./lib/select_database"
require "./lib/database_connection"

class Peep 

  attr_reader :id, :body, :posted_at

  def initialize(id, body, date, user_id)
    @id = id
    @body = body
    @posted_at = date
    @author = user_id
  end

  def self.all
    select_database

    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")

    peeps.map do |peep|
      Peep.new(peep["id"], peep["body"], peep["posted_at"], peep["user_id"])
    end
  end

  def self.add(peep, user_id)
    select_database

    result = DatabaseConnection.query(
                              "INSERT INTO peeps (body, user_id) 
                              VALUES ('#{peep}', '#{user_id}') 
                              RETURNING id, body, posted_at, user_id;"
                            )
    Peep.new(result[0]["id"], result[0]["body"], result[0]["posted_at"], result[0]["user_id"])
  end

end

require 'pg'

class Peep

  def self.all
    peeps = DatabaseConnection.query "SELECT * FROM peeps ORDER BY created_date"
    peeps.map do |peep|
      date = DateTime
        .strptime(peep['created_date'], "%Y-%m-%d %H:%M:%S")
        .strftime("%Y-%m-%d %H:%M:%S")
      { body: peep["body"],
        created_date: date }
    end
  end

  def self.create(peep)
    DatabaseConnection.query "INSERT INTO peeps(body, created_date) " +
    "VALUES('#{peep}', NOW())"
  end

end

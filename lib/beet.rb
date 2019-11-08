require_relative './setup_db'

class Beet
  def self.all
    response = DatabaseConnection.query("SELECT * FROM beets ORDER BY id;").values
    beets = []

    for value in response
      p value
      beets.push(value[1])
    end

    return beets
  end

  def self.add(beet)
    request = DatabaseConnection.query("INSERT INTO beets (beet_text) VALUES ('#{beet}');")
  end
end
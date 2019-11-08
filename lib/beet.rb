require_relative './setup_db'

class Beet
  def self.all
    response = DatabaseConnection.query("SELECT * FROM beets").values
    beets = []

    for value in response
      p value
      beets.push(value[1])
    end

    return beets
  end
end
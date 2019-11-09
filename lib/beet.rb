require_relative './setup_db'

class Beet
  attr_reader :text, :timestamp

  def initialize(text, timestamp)
    @text = text
    @timestamp = timestamp
  end

  def self.all
    response = DatabaseConnection.query("SELECT * FROM beets ORDER BY timestamp DESC;").values
    beets = []

    for value in response
      beets.push(Beet.new(value[1], value[2]))
    end

    return beets
  end

  def self.add(beet)
    result = DatabaseConnection.query("INSERT INTO beets (beet_text, timestamp) VALUES ('#{beet}', '#{Time.now}');")
  end

  # def self.edit(beet_id, new_text)
  # end
end
require_relative './setup_db'

class Beet
  attr_reader :text, :timestamp, :user

  def initialize(text, timestamp, user)
    @text = text
    @timestamp = timestamp
    @user = user
  end

  def self.all
    response = DatabaseConnection.query("SELECT * FROM beets ORDER BY timestamp DESC;").values
    beets = []

    for value in response
      beets.push(Beet.new(value[1], value[2], value[3]))
    end

    return beets
  end

  def self.add(text, user)
    result = DatabaseConnection.query("INSERT INTO beets (beet_text, timestamp, user_handle) VALUES ('#{text}', '#{Time.now}', '#{user}');")
  end

  # def self.edit(beet_id, new_text)
  # end
end
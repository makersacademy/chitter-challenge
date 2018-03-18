require_relative './database_connection_setup.rb'

class Peeps
  attr_reader :id, :date, :tweet

  def initialize(id, date, tweet)
    @id = id
    @date = date
    @tweet = tweet
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY id DESC')
    result.map { |peeps| Peeps.new(peeps['id'], peeps['date'], peeps['tweet']) }
  end

  def self.create(input)
    DatabaseConnection.query("INSERT INTO peeps (tweet) VALUES('#{input[:tweet]}');")
  end
end
